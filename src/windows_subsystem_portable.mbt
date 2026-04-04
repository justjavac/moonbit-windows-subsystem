///|
/// Does nothing on non-native targets.
fn enable_impl() -> Unit {
  ()
}

///|
/// Keeps the package API callable on non-native targets used for tests and
/// documentation builds.
///
/// The real Windows subsystem behavior is only enabled for the native target.
pub fn enable() -> Unit {
  enable_impl()
}
