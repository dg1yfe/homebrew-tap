# homebrew-tap

Homebrew formulae for [dg1yfe](https://github.com/dg1yfe)'s tools.

```
brew trust dg1yfe/tap
brew tap dg1yfe/tap
```

Homebrew 6 refuses to load formulae from a third-party tap until it is trusted.
Without the first command, `brew tap` fails with *Refusing to load formula from
untrusted tap*, followed by *invalid syntax in tap* — which points at the
formula rather than at the trust setting, so it is worth knowing in advance.
Trust one formula instead of the whole tap with
`brew trust --formula dg1yfe/tap/tabasm`.

## Formulae

| formula | what it is |
|---|---|
| [tabasm](https://github.com/dg1yfe/tabasm) | Table-driven cross-assembler for 8- and early-16-bit microprocessors. Twelve targets, five object formats. |

Or install one directly, once the tap is trusted:

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
