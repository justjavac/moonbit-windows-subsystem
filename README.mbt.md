# justjavac/windows_subsystem
[![coverage](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?label=coverage)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)
[![linux](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?flag=linux&label=linux)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)
[![macos](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?flag=macos&label=macos)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)
[![windows](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?flag=windows&label=windows)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)

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
