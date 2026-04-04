# justjavac/windows_subsystem

Keep the Windows GUI subsystem linker flags reachable from a MoonBit native
entry package.

## Usage

Add the package and call `enable()` once near the start of `main`:

```moonbit
fn main {
  @justjavac/windows_subsystem.enable()
  // Start your GUI app here.
}
```

The call is harmless on non-Windows and non-native targets and only affects
MSVC builds on Windows native executables.
