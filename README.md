# homebrew-tap

Homebrew formulae for [tabasm](https://github.com/dg1yfe/tabasm).

```
brew install dg1yfe/tap/tabasm
```

Or tap once and install by name:

```
brew tap dg1yfe/tap
brew install tabasm
```

The formula installs the prebuilt universal binary from the tabasm release, so
one download serves both Intel and Apple Silicon. Instruction tables go to
`$(brew --prefix)/share/tabasm/tables`, which is where the assembler looks when
run from `$(brew --prefix)/bin` — nothing needs configuring.

macOS only. `brew style` rejects per-platform `url` inside `on_linux`, which is
the pattern a multi-platform binary formula would need; Linux users can take
the tarball from the release directly, or the formula can be split later if it
turns out to matter.

## Updating for a new tabasm release

Three lines in `Formula/tabasm.rb`: `version`, `url` and `sha256`. The checksum
is in the release's own `SHA256SUMS`.

```
brew style Formula/tabasm.rb          # lint
brew install --build-from-source ./Formula/tabasm.rb
brew test tabasm
```
