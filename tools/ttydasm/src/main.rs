use std::path::{Path, PathBuf};

use anyhow::Context;
use hashbrown::HashMap;
use object::{Object, ObjectSection, ObjectSymbol, RelocationTarget};

mod opcode;
use opcode::Opcode;
mod reader;
use reader::{Arg, ExpressionType};
mod cli;
use cli::*;

use crate::reader::EventScript;

const MODULES: [&str; 31] = [
    "aaa", "aji", "bom", "dig", "dmo", "dou", "eki", "end", "gon", "gor", "gra", "hei", "hom", "jin", "jon",
    "kpa", "las", "moo", "mri", "muj", "nok", "pik", "qiz", "rsh", "sys", "tik", "tou", "tou2", "usu", "win",
    "yuu",
];

type ModuleMap = HashMap<String, RelocInfo>;
type RelocInfo = HashMap<u64, (String, i64)>;
type OwnedData<'a> = HashMap<&'a str, Vec<u8>>;
struct EventReader<'a> {
    /// Stores all lookup information for a given symbol
    lookup: ModuleMap,
    owned: OwnedData<'a>,
}

impl<'a> EventReader<'a> {
    fn initialize(relative_path: PathBuf) -> anyhow::Result<Self> {
        let mut lookup = ModuleMap::new();
        let mut owned = OwnedData::new();
        const BUILD_PATH: &str = "build/G8MJ01/";

        // First, process the dol since it has a shorter path.
        let key = "MarioSt";
        Self::generate_relocations(
            lookup.entry_ref(key).or_default(),
            &mut owned,
            relative_path.join(BUILD_PATH).join(format!("{key}.elf")).as_path(),
            key,
        )?;

        // Then, let's process each of the REL files.
        for module in MODULES {
            Self::generate_relocations(
                lookup.entry_ref(module).or_default(),
                &mut owned,
                relative_path.join(BUILD_PATH).join(module).join(format!("{module}.plf")).as_path(),
                module,
            )?;
        }

        Ok(Self { lookup, owned })
    }

    fn generate_relocations(
        relocs: &mut RelocInfo, data: &mut OwnedData<'a>, path: &Path, module: &'a str,
    ) -> anyhow::Result<()> {
        // First, grab the data for the file and let object parse it.
        let bytes = std::fs::read(path)?;
        let file = object::File::parse(&*bytes)?;

        // Iterate all relocations for each section and store all symbols.
        for section in file.sections() {
            for (offset, reloc) in section.relocations() {
                if let RelocationTarget::Symbol(sym_idx) = reloc.target() {
                    let symbol = file.symbol_by_index(sym_idx)?;
                    let name = symbol.name()?.to_string();
                    relocs.insert(offset, (name, reloc.addend()));
                }
            }
        }

        // Store the owned data so we can grab symbol data from it later.
        data.insert(module, bytes);
        Ok(())
    }

    fn get_script(&'a self, module: &'a str, symbol: &'a str) -> Option<EventScript<'a>> {
        let bytes = self.owned.get(module)?;
        let file = object::File::parse(&**bytes).ok()?;

        let symbol = file.symbol_by_name(symbol)?;
        let section_index = symbol.section_index()?;
        let section = file.section_by_index(section_index).ok()?;

        let script = section.data_range(symbol.address(), symbol.size()).ok()??;
        let base = symbol.address();
        let event = EventScript::new(file, script, base, self.lookup.get(module).unwrap());
        Some(event)
    }
}

fn main() -> anyhow::Result<()> {
    let cli: TopLevel = argp::parse_args_or_exit(argp::DEFAULT);

    match cli.nested {
        cli::NestedCommands::Extract(cmd) => {
            // Relative path to the root of the decomp project, TODO: configure via cli.
            let relative_path = PathBuf::from("."); // ../..
            let reader = EventReader::initialize(relative_path)?;
            let mut script = reader
                .get_script(&cmd.module, &cmd.symbol)
                .context(format!("Symbol wasn't found in module: {} -> {}", cmd.module, cmd.symbol,))?;

            while script.remaining() >= 4 {
                let command = script.read_i32()?;
                let argc = (command >> 16) as usize;
                let opcode_num = command & 0xFFFF;
                let opcode = Opcode::from_repr(opcode_num as usize)
                    .with_context(|| format!("unknown opcode {opcode_num:#04X}"))?;
                let opcode_str: &'static str = opcode.decomp_macros();
                let args = (0..argc).map(|_| script.read_arg()).collect::<anyhow::Result<Vec<_>>>()?;
                let rendered = args
                    .into_iter()
                    .map(|arg| {
                        match arg {
                            Arg::Imm(v) => Arg::Imm(ExpressionType::decode(v)),
                            other => other,
                        }
                    })
                    .map(|arg0: reader::Arg| Arg::to_string(&arg0))
                    .collect::<Vec<_>>()
                    .join(", ");
                println!("{opcode_str}({rendered})");
            }
        }
    }

    /*let data = std::fs::read("../../build/G8MJ01/dig/dig.plf")?;
    let file = object::File::parse(&*data)?;
    drop(data);

    let symbol = file
        .symbol_by_name("dig_00_init_evt")
        .context("symbol not found")?;
    let section_index = symbol.section_index().context("symbol has no section")?;
    let section = file.section_by_index(section_index)?;

    let relocations = generate_relocations(&file)?;

    let script = section
        .data_range(symbol.address(), symbol.size())?
        .context("symbol range out of section bounds")?;

    let mut reader = reader::EventReader::new(script, symbol.address(), &relocations);

    while reader.remaining() >= 4 {
        let command = reader.read_i32()?;
        let argc = (command >> 16) as usize;
        let opcode_num = command & 0xFFFF;
        let opcode = Opcode::from_repr(opcode_num as usize)
            .with_context(|| format!("unknown opcode {opcode_num:#04X}"))?;
        let opcode_str: &'static str = opcode.into();

        let args = (0..argc)
            .map(|_| reader.read_arg())
            .collect::<anyhow::Result<Vec<_>>>()?;
        let rendered = args
            .into_iter()
            .map(|arg| match arg {
                Arg::Imm(v) => Arg::Imm(ExpressionType::canonicalize(v)),
                other => other,
            })
            .map(|arg0: reader::Arg| Arg::to_string(&arg0))
            .collect::<Vec<_>>()
            .join(", ");
        //println!("{opcode_str}({rendered})");

        match opcode {
            /*Opcode::Set => {
                let target = reader.read_arg()?;
            }*/
            Opcode::RunEvent => {
                let script = reader.read_arg()?;
                println!("SPAWN_EVENT({script})");
            }
            Opcode::UserFunc => {
                let user_func = reader.read_arg()?;
                let params = (1..argc)
                    .map(|_| reader.read_arg())
                    .collect::<anyhow::Result<Vec<_>>>()?;
                let mut rendered: Vec<String> = vec![user_func.to_string()];
                for param in params {
                    match param {
                        Arg::Sym { name } => {
                            let symbol = file.symbol_by_name(&name).context("symbol not found")?;
                            let Some(section_index) = symbol.section_index() else {
                                rendered.push(name);
                                continue;
                            };
                            let section = file.section_by_index(section_index)?;
                            let bytes = section
                                .data_range(symbol.address(), symbol.size())?
                                .context("symbol range out of section bounds")?;
                            let (cow, _, had_errors) = SHIFT_JIS.decode(bytes);
                            if !had_errors {
                                rendered.push(format!("\"{cow}\""));
                            } else {
                                rendered.push(name);
                            }
                        }
                        Arg::Imm(_) => rendered.push(param.to_string()),
                    }
                }
                println!("CALL({})", rendered.join(", "));
            }
            Opcode::EndScript => break,
            _ => {
                let args = (0..argc)
                    .map(|_| reader.read_arg())
                    .collect::<anyhow::Result<Vec<_>>>()?;
                let mut rendered: Vec<String> = Vec::new();
                for arg in args {
                    match arg {
                        Arg::Imm(index) => {
                            let expr = ExpressionType::categorize(index);
                            let value = ExpressionType::canonicalize(index);
                            rendered.push(format!("{expr:?}({value})"));
                        }
                        Arg::Sym { name } => {
                            rendered.push(name);
                        }
                    }
                }
                println!("{opcode_str}({})", rendered.join(", "));
            }
        }
    }*/

    Ok(())
}
