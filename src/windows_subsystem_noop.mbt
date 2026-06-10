///|
/// Keeps calls to `enable()` harmless on non-native backends.
///
/// The Windows GUI subsystem linker directives only apply to native
/// executables. On WebAssembly and JavaScript targets, this function is a
/// no-op so shared entrypoint code can still call it unconditionally.
pub fn enable() -> Unit {
  ()
}
