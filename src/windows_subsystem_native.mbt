///|
/// References the native no-op symbol that keeps the Windows linker directives reachable.
extern "C" fn enable_windows_subsystem_native() -> Unit = "moonbit_windows_subsystem_enable"

///|
/// Keeps the package's Windows GUI subsystem stub reachable during linking.
///
/// Call this once near the beginning of your native application's `main`
/// function when you want the final Windows executable to use the GUI
/// subsystem instead of opening an extra console window.
///
/// At runtime, this function does not perform initialization, create a window,
/// or change any application state. Its only job is to reference the native C
/// stub so MSVC can still see these linker directives:
///
/// - `/SUBSYSTEM:WINDOWS`
/// - `/ENTRY:mainCRTStartup`
///
/// Those directives are only meaningful when compiling a native executable on
/// Windows with MSVC. On other platforms or toolchains, calling `enable()`
/// remains harmless but has no observable effect beyond referencing the stub
/// symbol.
///
/// Typical usage:
/// ```
/// @justjavac/windows_subsystem.enable()
/// ```
pub fn enable() -> Unit {
  // Keep the native stub reachable so the linker preserves its directives.
  enable_windows_subsystem_native()
}
