use argp::FromArgs;

#[derive(FromArgs, PartialEq, Debug)]
/// This provides tooling for interacting with TTYD scripts.
pub(crate) struct TopLevel {
    #[argp(subcommand)]
    pub(crate) nested: NestedCommands,
}

#[derive(FromArgs, PartialEq, Debug)]
#[argp(subcommand)]
pub(crate) enum NestedCommands {
    Extract(ExtractCommand),
    //Emulate(EmulateCommand),
}

#[derive(FromArgs, PartialEq, Debug)]
/// Extracts a given symbol as a script
#[argp(subcommand, name = "extract")]
pub(crate) struct ExtractCommand {
    #[argp(option, short = 'm')]
    /// The module to try looking for this symbol in.
    pub(crate) module: String,
    #[argp(option, short = 's')]
    /// The symbol to search for and convert.
    pub(crate) symbol: String,
    /// Relative path to the root of the decomp-toolkit project.
    #[argp(option, short = 'p', default = "String::from(\"../..\")")]
    pub(crate) relative_path: String,
}

/*
#[derive(FromArgs, PartialEq, Debug)]
/// Emulates running a script for easier debugging.
#[argp(subcommand, name = "emulate")]
struct EmulateCommand {
    #[argp(switch)]
    /// whether to fooey
    fooey: bool,
}
*/
