#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, strum::FromRepr, strum::IntoStaticStr)]
#[strum(serialize_all = "SCREAMING_SNAKE_CASE")]
pub(crate) enum Opcode {
    /// Internal opcode when loading the next opcode from a script.
    Next = 0,
    /// Ends the full script (i.e. stop parsing).
    EndScript = 1,

    /// `evt_end_evt`, acts as a return; statement inside a script, usually right before an [`EndScript`].
    EndEvent = 2,
    /// `evt_lbl`, marks a label that can later be jumped to.
    Label = 3,
    /// `evt_goto`, allows jumping to a label. Note that this does not take into account nesting.
    Goto = 4,
    /// `evt_do`, acts as the start of a loop (i.e. a do { } while ( );), and increases nesting.
    Do = 5,
    /// `evt_while`, acts as the end of a loop and test condition, potentially decreases nesting.
    While = 6,
    /// `evt_do_break`, acts as a `break;` inside a do-while loop, and jumps to after the condition.
    DoBreak = 7,
    /// `evt_do_continue`, acts as a `continue;` inside a do-while, and jumps to the while condition.
    DoContinue = 8,
    /// `evt_wait_frm`, pauses advancing the script for a given number of frames.
    WaitFrame = 9,
    /// `evt_wait_msec`, pauses advancing the script for a given number of milliseconds.
    WaitMsec = 10,
    /// `evt_halt`, pauses advancing the script, as long as a given condition is true (non-zero).
    Halt = 11,

    /// `evt_if_str_equal`, compares if two strings are equal, otherwise jumps to an else opcode.
    IfStrEqual = 12,
    /// `evt_if_str_not_equal`, compares if two strings are not equal, otherwise jumps to an else opcode.
    IfStrNotEqual = 13,
    /// `evt_if_str_small`, compares if str1 is less than str2, otherwise jumps to an else opcode.
    IfStrLess = 14,
    /// `evt_if_str_large`, compares if str1 is greater than str2, otherwise jumps to an else opcode.
    IfStrGreater = 15,
    /// `evt_if_str_small_equal`, compares if str1 is less than/equal to str2, otherwise jumps to an else
    /// opcode.
    IfStrLessOrEqual = 16,
    /// `evt_if_str_large_equal`, compares if str1 is greater than/equal to str2, otherwise jumps to an else
    /// opcode.
    IfStrGreaterOrEqual = 17,

    /// `evt_iff_equal`, compares if two floats are equal, otherwise jumps to an else opcode.
    IfFloatEqual = 18,
    /// `evt_iff_not_equal`, compares if two floats are not equal, otherwise jumps to an else opcode.
    IfFloatNotEqual = 19,
    /// `evt_iff_small`, compares if float1 is less than float2, otherwise jumps to an else opcode.
    IfFloatLess = 20,
    /// `evt_iff_large`, compares if float1 is greater than float2, otherwise jumps to an else opcode.
    IfFloatGreater = 21,
    /// `evt_iff_small_equal`, compares if float1 is less than/equal to float2, otherwise jumps to an else
    /// opcode.
    IfFloatLessOrEqual = 22,
    /// `evt_iff_large_equal`, compares if float1 is greater than/equal to float2, otherwise jumps to an else
    /// opcode.
    IfFloatGreaterOrEqual = 23,

    /// `evt_if_equal`, compares if two signed integers are equal, otherwise jumps to an else opcode.
    IfIntEqual = 24,
    /// `evt_if_not_equal`, compares if two signed integers are not equal, otherwise jumps to an else opcode.
    IfIntNotEqual = 25,
    /// `evt_if_small`, compares if value1 is less than value2, otherwise jumps to an else opcode.
    IfIntLess = 26,
    /// `evt_if_large`, compares if value1 is greater than value2, otherwise jumps to an else opcode.
    IfIntGreater = 27,
    /// `evt_if_small_equal`, compares if value1 is less than/equal to value2, otherwise jumps to an else
    /// opcode.
    IfIntLessOrEqual = 28,
    /// `evt_if_large_equal`, compares if value1 is greater than/equal to value2, otherwise jumps to an else
    /// opcode.
    IfIntGreaterOrEqual = 29,

    /// `evt_if_flag`, checks whether the given flags/bits are set in the value, otherwise jumps to an else
    /// opcode.
    IfFlag = 30,
    /// `evt_if_not_flag`, checks whether the given flags/bits are not set in the value, otherwise jumps to an
    /// else opcode.
    IfNotFlag = 31,

    /// `evt_else`, searches and jumps to the next [`EndIf`] opcode.
    Else = 32,
    /// `evt_end_if`, acts as a label to mark the end of an if/else statement when doing a forward search.
    EndIf = 33,

    /// `evt_switch`, enters a switch statement context comparing to the given value.
    Switch = 34,
    /// `evt_switchi`, enters a switch statement context comparing to the given immediate.
    SwitchImm = 35,
    /// `evt_case_equal`, compares whether the switch value is equal to a given value, else jump to the next
    /// case.
    CaseEqual = 36,
    /// `evt_case_not_equal`, compares whether the switch value is not equal to a given value, else jump to
    /// the next case.
    CaseNotEqual = 37,
    /// `evt_case_small`, compares whether the switch value is less than a given value, else jump to the next
    /// case.
    CaseLess = 38,
    /// `evt_case_large`, compares whether the switch value is greater than a given value, else jump to the
    /// next case.
    CaseGreater = 39,
    /// `evt_case_small_equal`, compares whether the switch value is less than/equal to a given value, else
    /// jump to the next case.
    CaseLessOrEqual = 40,
    /// `evt_case_large_equal`, compares whether the switch value is greater than/equal to a given value, else
    /// jump to the next case.
    CaseGreaterOrEqual = 41,
    /// `evt_case_etc`, acts as the `default:` case if no other case matches the switch statement.
    CaseDefault = 42,
    /// `evt_case_or`, adds an additional `or` comparison against a given value.
    CaseOr = 43,
    /// `evt_case_and`, adds an additional `and` comparison against a given value.
    CaseAnd = 44,
    /// `evt_case_flag`, compares whether the given flags/bits are set in the switch value, else jump to the
    /// next case.
    CaseFlag = 45,
    /// `evt_case_end`, acts as the end tag when using and/or to create a shared case statement.
    CaseEnd = 46,
    /// `evt_case_between`, compares whether the switch value is between two values (inclusive), else jump to
    /// the next case.
    CaseBetween = 47,
    /// `evt_switch_break`, acts as a `break;` inside a switch statement and jumps to the [`EndSwitch`]
    /// opcode.
    SwitchBreak = 48,
    /// `evt_end_switch`, acts as a label to denote the end of a switch statement context.
    EndSwitch = 49,

    /// `evt_set`, sets an address to the given (signed integer) value.
    Set = 50,
    /// `evt_seti`, sets an address to the given (signed integer) immediate.
    SetImm = 51,
    /// `evt_setf`, sets an address to the given (float) value.
    SetFloat = 52,
    /// `evt_add`, adds the given (signed integer) value to an address's value.
    Add = 53,
    /// `evt_sub`, subtracts the given (signed integer) value from an address's value.
    Subtract = 54,
    /// `evt_mul`, multiplies an address's value with the given (signed integer) value.
    Multiply = 55,
    /// `evt_div`, divides an address's value by the given (signed integer) value.
    Divide = 56,
    /// `evt_mod`, stores the modulo from dividing an address's value with the given (signed integer) value.
    Modulo = 57,
    /// `evt_addf`, adds the given (float) value to an address's value.
    AddFloat = 58,
    /// `evt_subf`, subtracts the given (float) value from an address's value.
    SubtractFloat = 59,
    /// `evt_mulf`, multiplies an address's value with the given (float) value.
    MultiplyFloat = 60,
    /// `evt_divf`, divides an address's value by the given (float) value.
    DivideFloat = 61,

    /// `evt_set_read`, sets the (signed integer) read address for any read operations.
    SetRead = 62,
    /// `evt_read`, reads one value from the (signed integer) read address.
    ReadInt = 63,
    /// `evt_read2`, reads two values from the (signed integer) read address.
    ReadInt2 = 64,
    /// `evt_read3`, reads three values from the (signed integer) read address.
    ReadInt3 = 65,
    /// `evt_read4`, reads four values from the (signed integer) read address.
    ReadInt4 = 66,
    /// `evt_read_n`, reads the n'th value from the (signed integer) read address.
    ReadIntN = 67,
    /// `evt_set_readf`, sets the (float) read address for any read operations.
    SetReadFloat = 68,
    /// `evt_readf`, reads one value from the (float) read address.
    ReadFloat = 69,
    /// `evt_readf2`, reads two values from the (float) read address.
    ReadFloat2 = 70,
    /// `evt_readf3`, reads three values from the (float) read address.
    ReadFloat3 = 71,
    /// `evt_readf4`, reads four values from the (float) read address.
    ReadFloat4 = 72,
    /// `evt_readf_n`, BUGGED, reads the n'th value from the (signed integer) read address (not the float
    /// address!).
    ReadFloatN = 73,

    /// `evt_set_user_wrk`, sets the base address for the user work array.
    SetUserWorkBase = 74,
    /// `evt_set_user_flg`, sets the base address for the user flag array.
    SetUserFlagBase = 75,
    /// `evt_alloc_user_wrk`, allocates n values and sets the base address for the user work array.
    AllocUserWork = 76,

    /// `evt_and`, stores an address's value bitwise-and the given value.
    And = 77,
    /// `evt_andi`, stores an address's value bitwise-and the given immediate.
    AndImm = 78,
    /// `evt_or`, stores an address's value bitwise-or the given value.
    Or = 79,
    /// `evt_ori`, stores an address's value bitwise-or the given immediate.
    OrImm = 80,

    /// `evt_set_frame_from_msec`, sets an address's value to the frame count from a given number of
    /// milliseconds.
    SetFrameFromMsec = 81,
    /// `evt_set_msec_from_frame`, sets an address's value to the number of milliseconds from a given frame
    /// count.
    SetMsecFromFrame = 82,

    /// `evt_set_ram`, sets a ram address's value to the given (signed integer) value.
    SetRam = 83,
    /// `evt_set_ramf`, sets a ram address's value to the given (float) value.
    SetRamFloat = 84,
    /// `evt_get_ram`, reads the (signed integer) value of the given ram address.
    GetRam = 85,
    /// `evt_get_ramf`, reads the (float) value of the given ram address.
    GetRamFloat = 86,

    /// `evt_setr`, sets an indirect address's value to the given (signed integer) value.
    SetIndirect = 87,
    /// `evt_setrf`, sets an indirect address's value to the given (float) value.
    SetIndirectFloat = 88,
    /// `evt_getr`, stores an indirect address's (signed integer) value in the given address.
    GetIndirect = 89,
    /// `evt_getrf`, stores an indirect address's (float) value in the given address.
    GetIndirectFloat = 90,

    /// `evt_user_func`, runs C code for a given user function, allowing more control when scripting.
    UserFunc = 91,

    /// `evt_run_evt`, runs a script with the current script's parameters cloned.
    RunEvent = 92,
    /// `evt_run_evt_id`, runs a script with the current script's parameters cloned, and returns the
    /// `eventId`.
    RunEventId = 93,
    /// `evt_run_child_evt`, pauses the current script and runs a child script to completion before
    /// continuing.
    RunChildEvent = 94,
    /// `evt_delete_evt`, deletes an `eventId` and all children and siblings.
    DeleteEvent = 95,
    /// `evt_restart_evt`, restarts the current script at a given (arbitrary) opcode.
    RestartEvent = 96,
    /// `evt_set_pri`, sets the priority for the current script so it runs before or after certain other
    /// scripts.
    SetPriority = 97,
    /// `evt_set_spd`, sets the "speed" of the current script (i.e. how many commands can be processed per
    /// frame).
    SetSpeed = 98,
    /// `evt_set_type`, sets the "type" of the current script, which can include or exclude it from being
    /// stopped/started.
    SetType = 99,
    /// `evt_stop_all`, stops all running scripts with a type matching the given mask.
    StopAll = 100,
    /// `evt_start_all`, starts all running scripts with a type matching the given mask.
    StartAll = 101,
    /// `evt_stop_other`, stops all running scripts with a type matching the given mask, skipping the current
    /// script.
    StopOther = 102,
    /// `evt_start_other`, starts all running scripts with a type matching the given mask, skipping the
    /// current script.
    StartOther = 103,
    /// `evt_stop_id`, finds and stops the script with the given `eventId`.
    StopId = 104,
    /// `evt_start_id`, finds and starts the script with the given `eventId`.
    StartId = 105,
    /// `evt_chk_evt`, returns whether a given `eventId` is currently alive (suspended or running).
    CheckEvent = 106,
    /// `evt_inline_evt`, spawns an "inline"/concurrent script, based on the current next opcode.
    InlineEvent = 107,
    /// `evt_inline_evt_id`, spawns an "inline"/concurrent script, based on the current next opcode. amd
    /// returns the `eventId`.
    InlineEventId = 108,
    /// `evt_end_inline`, acts as the ending tag for a spawned "inline"/concurrent script.
    EndInline = 109,
    /// `evt_brother_evt`, spawns a script with the same lifetime as the current script.
    SiblingEvent = 110,
    /// `evt_brother_evt_id`, spawns a script with the same lifetime as the current script, and returns the
    /// `eventId`.
    SiblingEventId = 111,
    /// `evt_end_brother`, acts as the ending tag for a spawned sibling script (alongside another script).
    EndSibling = 112,

    /// `evt_debug_put_msg`, stubbed in retail, unknown.
    DebugPutMsg = 113,
    /// `evt_debug_msg_clear`, stubbed in retail, unknown.
    DebugMsgClear = 114,
    /// `evt_debug_put_reg`, prints out the status of all registers to the console.
    DebugPutReg = 115,
    /// `evt_debug_name`, sets the name of the current script.
    DebugName = 116,
    /// `evt_debug_rem`, stubbed in retail, unknown.
    DebugRem = 117,
    /// `evt_debug_bp`, unknown functionality in retail, doesn't have any side effects.
    DebugBreakpoint = 118,
}

impl Opcode {
    pub fn decomp_macros(&self) -> &'static str {
        match self {
            Self::Next => unreachable!(),
            Self::EndScript => "END",
            Self::EndEvent => "RETURN",
            Self::Do => "LOOP",
            Self::While => "END_LOOP",
            Self::DoBreak => "BREAK_LOOP",
            Self::DoContinue => "CONTINUE_LOOP",
            Self::WaitFrame => "WAIT_FRAMES",
            Self::WaitMsec => "WAIT_MS",
            Self::Halt => "WAIT_WHILE",
            Self::IfFlag => "IF_BITS_SET",
            Self::IfNotFlag => "IF_BITS_CLEAR",
            Self::SwitchImm => "SWITCH_RAW",
            Self::CaseOr => "CASE_OR_EQUAL",
            Self::CaseAnd => "CASE_AND_EQUAL",
            Self::SwitchBreak => "BREAK_SWITCH",
            Self::Set => "SET_VALUE",
            Self::SetImm => "SET_RAW_VALUE",
            Self::SetFloat => "SET_FLOAT_VALUE",
            Self::SetRead => "SET_INT_READ_ADDR",
            Self::ReadIntN => "READ_INT_INDEXED",
            Self::SetReadFloat => "SET_FLOAT_READ_ADDR",
            Self::ReadFloatN => "READ_FLOAT_INDEXED",
            Self::SetUserWorkBase => "SET_UW_BASE",
            Self::SetUserFlagBase => "SET_UF_BASE",
            Self::AllocUserWork => "ALLOCATE_UW",
            Self::AndImm => "AND_RAW",
            Self::OrImm => "OR_RAW",
            Self::SetFrameFromMsec => "CONVERT_MS_TO_FRAME",
            Self::SetMsecFromFrame => "CONVERT_FRAME_TO_MS",
            Self::SetRam => "POKE_INT",
            Self::SetRamFloat => "POKE_FLOAT",
            Self::GetRam => "PEEK_INT",
            Self::GetRamFloat => "PEEK_FLOAT",
            Self::SetIndirect => "SET_INT_INDEXED",
            Self::SetIndirectFloat => "SET_FLOAT_INDEXED",
            Self::GetIndirect => "GET_INT_INDEXED",
            Self::GetIndirectFloat => "GET_FLOAT_INDEXED",
            Self::UserFunc => "CALL",
            Self::RunEvent => "SPAWN_EVENT",
            Self::RunEventId => "SPAWN_EVENT_GET_ID",
            Self::RunChildEvent => "CALL_CHILD",
            Self::StopAll => "SUSPEND_TYPES",
            Self::StartAll => "RESUME_TYPES",
            Self::StopOther => "SUSPEND_TYPES_OTHER",
            Self::StartOther => "RESUME_TYPES_OTHER",
            Self::StopId => "SUSPEND_EVENT",
            Self::StartId => "RESUME_EVENT",
            Self::CheckEvent => "IS_EVENT_RUNNING",
            Self::InlineEvent => "BEGIN_INLINE_EVENT",
            Self::InlineEventId => "BEGIN_INLINE_EVENT_GET_ID",
            Self::EndInline => "END_INLINE_EVENT",
            Self::SiblingEvent => "BEGIN_SIBLING_EVENT",
            Self::SiblingEventId => "BEGIN_SIBLING_EVENT_GET_ID",
            Self::EndSibling => "END_SIBLING_EVENT",
            other => other.into(),
        }
    }

    pub fn increase_indent(&self, indentation: &mut usize) {
        match self {
            Self::Do
            | Self::IfStrEqual
            | Self::IfStrNotEqual
            | Self::IfStrLess
            | Self::IfStrGreater
            | Self::IfStrLessOrEqual
            | Self::IfStrGreaterOrEqual
            | Self::IfFloatEqual
            | Self::IfFloatNotEqual
            | Self::IfFloatLess
            | Self::IfFloatGreater
            | Self::IfFloatLessOrEqual
            | Self::IfFloatGreaterOrEqual
            | Self::IfIntEqual
            | Self::IfIntNotEqual
            | Self::IfIntLess
            | Self::IfIntGreater
            | Self::IfIntLessOrEqual
            | Self::IfIntGreaterOrEqual
            | Self::IfFlag
            | Self::IfNotFlag
            | Self::Switch
            | Self::SwitchImm
            | Self::InlineEvent
            | Self::InlineEventId
            | Self::SiblingEvent
            | Self::SiblingEventId => {
                *indentation = indentation.saturating_add(1);
            }

            _ => {}
        }
    }

    pub fn decrease_indent(&self, indentation: &mut usize) {
        match self {
            Self::While | Self::EndIf | Self::EndSwitch | Self::EndInline | Self::EndSibling => {
                *indentation = indentation.saturating_sub(1)
            }

            _ => {}
        }
    }

    pub fn is_tag(&self) -> bool {
        matches!(
            self,
            // Termination
            Self::EndScript        // END
            | Self::EndEvent       // RETURN
            // Loops
            | Self::While          // END_LOOP
            | Self::DoBreak        // BREAK_LOOP
            | Self::DoContinue     // CONTINUE_LOOP
            // Conditionals
            | Self::Else           // ELSE
            | Self::EndIf          // END_IF
            // Switch
            | Self::CaseDefault    // CASE_DEFAULT
            | Self::CaseEnd        // CASE_END
            | Self::SwitchBreak    // BREAK_SWITCH
            | Self::EndSwitch      // END_SWITCH
            // Inline / sibling events
            | Self::InlineEvent    // BEGIN_INLINE_EVENT
            | Self::EndInline      // END_INLINE_EVENT
            | Self::SiblingEvent   // BEGIN_SIBLING_EVENT
            | Self::EndSibling // END_SIBLING_EVENT
        )
    }
}
