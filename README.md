# moonbit-windows-subsystem
[![coverage](https://img.shields.io/codecov/c/github/justjavac/moonbit-windows-subsystem/main?label=coverage)](https://codecov.io/gh/justjavac/moonbit-windows-subsystem)

`moonbit-windows-subsystem` is a tiny MoonBit native helper that keeps the
Windows GUI subsystem linker options in the final executable. It is useful for
desktop entry packages that should launch without an extra console window on
Windows.

## Why this package exists

When a MoonBit native application links through MSVC on Windows, the linker
needs `/SUBSYSTEM:WINDOWS` and an entrypoint such as `mainCRTStartup` for GUI
style executables. This package ships a minimal C stub that carries those
directives and exposes a single MoonBit function that makes the symbol
reachable, so the linker keeps the object file.

The native stub is intentionally a no-op at runtime. It does not create a
window, initialize a GUI framework, or alter your application logic. Its only
purpose is to keep the linker directives attached to the final native binary.

## Installation

Add the package in your MoonBit project:

```bash
moon add justjavac/windows_subsystem
```

## API

### `enable()`

```moonbit
fn main {
  windows_subsystem.enable()
  // Initialize the rest of the desktop application.
}
```

Call `enable()` once near the start of your native desktop entry package.

What it does:

- Keeps the package's native stub reachable during linking.
- Lets MSVC apply `/SUBSYSTEM:WINDOWS` and `/ENTRY:mainCRTStartup`.
- Helps the final Windows executable start without an extra console window.

What it does not do:

- It does not create a window.
- It does not initialize any GUI toolkit.
- It does not change your application's startup logic beyond keeping the stub
  object linked in.

## Development

Common local commands:

```bash
moon test --target native -v --target-dir .moonbuild/native
moon test --target native --enable-coverage -v --target-dir .moonbuild/coverage-native
moon coverage report --target-dir .moonbuild/coverage-native -f cobertura -o coverage/windows.xml
moon info
moon fmt
```

## Coverage reporting

The repository uploads a single native coverage report from the Windows CI job.
Badges update after GitHub Actions uploads that report and Codecov finishes
processing it.

## License

This project is released under the MIT License. See [LICENSE](LICENSE).
