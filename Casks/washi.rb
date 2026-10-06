cask "washi" do
  version "0.1.0"
  sha256 "1b473e75ac624982bd56eb1355b2f5a69cf1cd8201e0840da25b73d3c10cd100"

  url "https://github.com/kiwamizamurai/washi/releases/download/v#{version}/Washi-#{version}-aarch64.zip"
  name "Washi"
  desc "Quiet viewer for Markdown, Typst, LaTeX, Mermaid and PDF"
  homepage "https://github.com/kiwamizamurai/washi"

  depends_on arch: :arm64
  # Renders LaTeX (latexmk is used instead when it is on the PATH)
  depends_on formula: "tectonic"
  depends_on :macos

  app "Washi.app"
  # Puts the washi command on the PATH (usable from a terminal or an AI agent)
  binary "#{appdir}/Washi.app/Contents/MacOS/washi"

  # Unsigned (ad-hoc): drop the quarantine attribute Homebrew adds, to avoid the first-launch warning
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Washi.app"],
        writable_paths: ["Washi.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/dev.kiwamizamurai.washi",
    "~/Library/Caches/dev.kiwamizamurai.washi",
    "~/Library/WebKit/dev.kiwamizamurai.washi",
  ]
end
