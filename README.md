# moonbit-windows-subsystem

`moonbit-windows-subsystem` is a tiny MoonBit native helper that keeps the
Windows GUI subsystem linker options in the final executable. It is useful for
desktop entry packages that should launch without an extra console window on
Windows while still building cleanly on Linux and macOS.

## Why this package exists

When a MoonBit native application links through MSVC on Windows, the linker
needs `/SUBSYSTEM:WINDOWS` and an entrypoint such as `mainCRTStartup` for GUI
style executables. This package ships a minimal C stub that carries those
directives and exposes a single MoonBit function that makes the symbol
reachable, so the linker keeps the object file.

The native stub is intentionally a no-op at runtime. On non-Windows platforms,
the C file compiles without special behavior, which means cross-platform
projects can call the API unconditionally.

## Installation

Add the package in your MoonBit project:

```bash
moon add justjavac/windows_subsystem
```

## API

### `enable()`

```moonbit
fn main {
  @justjavac/windows_subsystem.enable()
  // Initialize the rest of the desktop application.
}
```

Call `enable()` once near the start of your native desktop entry package. The
function does not configure a windowing toolkit for you; it only keeps the
linker directives alive so the executable can use the Windows GUI subsystem.

## Development

Common local commands:

```bash
moon test --target native -v --target-dir .moonbuild/native
moon info
moon fmt
```

## License

This project is released under the MIT License. See [LICENSE](LICENSE).
