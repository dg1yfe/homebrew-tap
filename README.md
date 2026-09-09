# homebrew-tap

Homebrew formulae for [dg1yfe](https://github.com/dg1yfe)'s tools.

```
brew tap dg1yfe/tap
```

## Formulae

| formula | what it is |
|---|---|
| [tabasm](https://github.com/dg1yfe/tabasm) | Table-driven cross-assembler for 8- and early-16-bit microprocessors. Twelve targets, five object formats. |

Install one without tapping first:

```
brew install dg1yfe/tap/tabasm
```

## Notes on tabasm

The formula installs the prebuilt universal binary from the release, so one
download serves both Intel and Apple Silicon. Instruction tables go to
`$(brew --prefix)/share/tabasm/tables`, which is where the assembler looks when
run from `$(brew --prefix)/bin` — nothing needs configuring.

macOS only. `brew style` rejects a per-platform `url` inside `on_linux`, which
is what a multi-platform binary formula would need; Linux users can take the
tarball from the release directly.

## Updating a formula for a new release

Three lines: `version`, `url` and `sha256`. The checksum is in the release's own
`SHA256SUMS`.

```
brew style Formula/<name>.rb
brew install dg1yfe/tap/<name>
brew test <name>
```
