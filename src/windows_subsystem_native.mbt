///|
/// Binds the native no-op symbol that carries the Windows linker directives.
extern "C" fn enable_windows_subsystem_native() -> Unit = "moonbit_windows_subsystem_enable"

///|
/// Ensures the package's Windows GUI subsystem stub is retained by the linker.
///
/// This function is the package's only public entrypoint. Call it once near the
/// start of your native application's `main` function when you want the final
/// Windows executable to use the GUI subsystem instead of opening an extra
/// console window.
///
/// At runtime, the function does not perform any application initialization and
/// does not create a window for you. Its job is purely to keep the native C
/// object file reachable so MSVC can see these linker directives:
///
/// - `/SUBSYSTEM:WINDOWS`
/// - `/ENTRY:mainCRTStartup`
///
/// Those directives are only meaningful when compiling a native executable on
/// Windows with MSVC. On other native toolchains, calling `enable()` remains
/// harmless but has no special effect beyond referencing the stub symbol.
pub fn enable() -> Unit {
  // Keep the native stub reachable so the linker preserves its directives.
  enable_windows_subsystem_native()
}
