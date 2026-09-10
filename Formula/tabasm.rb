class Tabasm < Formula
  desc "Table-driven cross-assembler for 8- and 16-bit microprocessors"
  homepage "https://github.com/dg1yfe/tabasm"
  url "https://github.com/dg1yfe/tabasm/releases/download/v2026.9.3/tabasm-2026.9.3-universal-macos.tar.gz"
  version "2026.9.3"
  sha256 "acdabcc134d0fb1ba6fdf96666035ea48d106305208d067a06020919acc59210"
  license "BSD-3-Clause"

  # The release archive holds a universal binary, so one download serves both
  # Intel and Apple Silicon.
  depends_on :macos

  def install
    bin.install "tabasm"
    # pkgshare is <prefix>/share/tabasm. Run from <prefix>/bin, the assembler
    # looks there for its tables, so nothing needs configuring -- no wrapper
    # script and no environment variable.
    pkgshare.install "tables"
    man1.install "doc/tabasm.1"
    doc.install "README.md", "NOTICE", "doc/table-format.md", "doc/table-format-legacy.md"
  end

  test do
    # The leading whitespace matters: column one is the label field, so an
    # unindented mnemonic is read as a label and emits nothing. A squiggly
    # heredoc would strip exactly that indentation.
    (testpath/"t.asm").write "        .org 0\n        nop\n        .end\n"
    system bin/"tabasm", "--cpu", "z80", "t.asm", "t.obj", "t.lst"
    assert_path_exists testpath/"t.obj"

    # 6303 is the table this project adds over the original, and XGDX is one
    # of the instructions only that processor has. It encodes to 18.
    (testpath/"h.asm").write "        .org 0\n        XGDX\n        .end\n"
    system bin/"tabasm", "--cpu", "6303", "h.asm", "h.obj", "h.lst"
    assert_match "18", (testpath/"h.lst").read
  end
end
