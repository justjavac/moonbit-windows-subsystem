# justjavac/windows_subsystem
[![coverage](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?label=coverage)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)

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

`enable()` does not create windows or initialize any GUI framework. It only
keeps the package's native stub reachable so MSVC can apply the Windows GUI
subsystem linker directives to the final executable.

Use this package for native desktop entry binaries that should start without an
extra console window on Windows.
