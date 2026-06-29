use std::fmt;

use anyhow::Context as _;
use hashbrown::HashMap;
use object::{File, Object as _, ObjectSection as _, ObjectSymbol as _, SectionKind};

use crate::opcode::Opcode;

#[derive(Debug, PartialEq, Eq)]
pub(crate) enum ExpressionType {
    Address,
    Pointer,
    Float,
    UserFlag,
    UserWork,
    GlobalSavedWork,
    LocalSavedWork,
    GlobalSavedWorkFlag,
    LocalSavedWorkFlag,
    GlobalFlag,
    LocalFlag,
    GlobalWork,
    LocalWork,
    Immediate,
}

impl ExpressionType {
    /// Maps an index to the "region" it belongs to.
    pub fn category(index: i32) -> Self {
        match index {
            i32::MIN..=-270000000 => Self::Address,
            -269999999..=-250000000 => Self::Pointer,
            -249999999..=-220000000 => Self::Float,
            -219999999..=-200000000 => Self::UserFlag,
            -199999999..=-180000000 => Self::UserWork,
            -179999999..=-160000000 => Self::GlobalSavedWork,
            -159999999..=-140000000 => Self::LocalSavedWork,
            -139999999..=-120000000 => Self::GlobalSavedWorkFlag,
            -119999999..=-100000000 => Self::LocalSavedWorkFlag,
            -99999999..=-80000000 => Self::GlobalFlag,
            -79999999..=-60000000 => Self::LocalFlag,
            -59999999..=-40000000 => Self::GlobalWork,
            -39999999..=-20000000 => Self::LocalWork,
            _ => Self::Immediate,
        }
    }

    /// Decodes an index and returns the "relative" index inside that category.
    pub fn decode(index: i32) -> i32 {
        match Self::category(index) {
            Self::Address | Self::Pointer | Self::Immediate => index,
            Self::Float => index + 230000000,
            Self::UserFlag => index + 210000000,
            Self::UserWork => index + 190000000,
            Self::GlobalSavedWork => index + 170000000,
            Self::LocalSavedWork => index + 150000000,
            Self::GlobalSavedWorkFlag => index + 130000000,
            Self::LocalSavedWorkFlag => index + 110000000,
            Self::GlobalFlag => index + 90000000,
            Self::LocalFlag => index + 70000000,
            Self::GlobalWork => index + 50000000,
            Self::LocalWork => index + 30000000,
        }
    }
}

#[derive(Debug, Clone)]
pub(crate) enum Arg {
    /// Encountered a symbol at this offset.
    Symbol { name: String },
    /// The expression is a stored float (see check_float in manager/evtmgr_cmd).
    Float(f32),
    /// The expression represents a value stored inside an intermediate location.
    Stored { location: &'static str, value: i32 },
    /// The expression is an immediate, no decoding necessary.
    Imm(i32),
}

impl fmt::Display for Arg {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Symbol { name } => write!(f, "{name}"),
            Self::Float(value) => write!(f, "FLOAT({value:?}f)"),
            Self::Stored { location, value } => write!(f, "{location}({value})"),
            Self::Imm(value) => write!(f, "{value}"),
        }
    }
}

pub(crate) struct EventScript<'a> {
    /// The parsed `File` handle for obtaining sections and symbols.
    file: File<'a>,
    /// The raw data backing the actual script.
    data: &'a [u8],
    /// Mapping from section-relative offset -> (symbol_name, addend)
    lookup: &'a HashMap<u64, String>,
    /// Section-relative address of [`Self::data`]
    base: u64,
    /// Current position within [`Self::data`]
    pos: usize,
}

impl<'a> EventScript<'a> {
    pub fn new(file: File<'a>, data: &'a [u8], base: u64, lookup: &'a HashMap<u64, String>) -> Self {
        Self { file, data, lookup, base, pos: 0 }
    }

    pub fn remaining(&self) -> usize {
        self.data.len() - self.pos
    }

    pub fn offset(&self) -> u64 {
        self.base + self.pos as u64
    }

    pub fn read_i32(&mut self) -> anyhow::Result<i32> {
        let end = self.pos + 4;
        let word = *self.data[self.pos..].first_chunk::<4>().context("Reached end of the stream")?;
        self.pos = end;
        Ok(i32::from_be_bytes(word))
    }

    pub fn read_arg(&mut self) -> anyhow::Result<Arg> {
        let offset = self.offset();
        let raw = self.read_i32()?;
        let category = ExpressionType::category(raw);

        // Guard since my current test script doesn't hit this path
        if category == ExpressionType::Address || category == ExpressionType::Pointer {
            println!("TODO: need to fixup this once I encounter it!");
        }

        // There may be a symbol at this offset but doesn't show up because object didn't resolve it.
        if let Some(name) = self.lookup.get(&offset) {
            let symbol = self.file.symbol_by_name(name).context("symbol not found")?;

            let Some(section_index) = symbol.section_index() else {
                return Ok(Arg::Symbol { name: name.to_string() });
            };

            let section = self.file.section_by_index(section_index)?;
            if section.kind() != SectionKind::ReadOnlyData {
                return Ok(Arg::Symbol { name: name.to_string() });
            }

            let bytes = section
                .data_range(symbol.address(), symbol.size())?
                .context("symbol range out of section bounds")?;
            let (cow, _, had_errors) = encoding_rs::SHIFT_JIS.decode(bytes);
            match had_errors {
                true => Ok(Arg::Symbol { name: name.to_string() }),
                false => Ok(Arg::Symbol { name: format!("STRING(\"{cow}\")") }),
            }
        } else {
            match category {
                ExpressionType::Address => {
                    let name =
                        self.lookup.get(&offset).context("Unable to get relocation for index {raw}")?;
                    Ok(Arg::Symbol { name: name.to_string() })
                }
                ExpressionType::Pointer => {
                    let name =
                        self.lookup.get(&offset).context("Unable to get relocation for index {raw}")?;
                    Ok(Arg::Symbol { name: name.to_string() })
                }
                ExpressionType::Float => {
                    let value = ExpressionType::decode(raw) as f32;
                    Ok(Arg::Float(value / 1024.0))
                }
                ExpressionType::UserFlag => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "UF", value })
                }
                ExpressionType::UserWork => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "UW", value })
                }
                ExpressionType::GlobalSavedWork => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "GSW", value })
                }
                ExpressionType::LocalSavedWork => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "LSW", value })
                }
                ExpressionType::GlobalSavedWorkFlag => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "GSWF", value })
                }
                ExpressionType::LocalSavedWorkFlag => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "LSWF", value })
                }
                ExpressionType::GlobalFlag => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "GF", value })
                }
                ExpressionType::LocalFlag => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "LF", value })
                }
                ExpressionType::GlobalWork => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "GW", value })
                }
                ExpressionType::LocalWork => {
                    let value = ExpressionType::decode(raw);
                    Ok(Arg::Stored { location: "LW", value })
                }
                ExpressionType::Immediate => Ok(Arg::Imm(raw)),
            }
        }
    }

    pub fn extract(&mut self, symbol: &str) -> anyhow::Result<()> {
        // TODO: I forgot to add nesting for the relevant commands, and also I need to emit
        // STRING() if I resolve a symbol. I also need to not emit parentheses on the handful of
        // tags we have
        let mut indentation = 1;
        println!("EVT_BEGIN({})", symbol);
        while self.remaining() >= 4 {
            let command = self.read_i32()?;
            let argc = (command >> 16) as usize;
            let opcode_num = command & 0xFFFF;
            let opcode = Opcode::from_repr(opcode_num as usize)
                .with_context(|| format!("unknown opcode {opcode_num:#04X}"))?;
            let opcode_str: &'static str = opcode.decomp_macros();
            opcode.decrease_indent(&mut indentation);
            match opcode.is_tag() {
                true => println!("{}{opcode_str}", "    ".repeat(indentation)),
                false => {
                    let args = (0..argc).map(|_| self.read_arg()).collect::<anyhow::Result<Vec<_>>>()?;
                    let rendered = args
                        .into_iter()
                        .map(|arg0: Arg| Arg::to_string(&arg0))
                        .collect::<Vec<_>>()
                        .join(", ");
                    println!("{}{opcode_str}({rendered})", "    ".repeat(indentation));
                }
            }
            opcode.increase_indent(&mut indentation);
        }
        println!("EVT_END()");
        Ok(())
    }
}
