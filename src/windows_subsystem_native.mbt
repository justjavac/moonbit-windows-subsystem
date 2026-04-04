///|
/// Binds the native no-op symbol that carries the Windows linker directives.
extern "C" fn enable_windows_subsystem_native() -> Unit = "moonbit_windows_subsystem_enable"

///|
/// @coverage.skip
/// Calls the native stub so the linker keeps the subsystem directives.
fn enable_impl() -> Unit {
  enable_windows_subsystem_native()
}

///|
/// @coverage.skip
/// Keeps the Windows GUI subsystem stub in the final native executable.
///
/// Call this near the start of `main` for desktop entry packages that should
/// open without an extra console window on Windows.
///
/// The function is a safe no-op on non-Windows platforms because the native
/// stub only adds linker directives when compiling with MSVC on Windows.
pub fn enable() -> Unit {
  enable_impl()
}
