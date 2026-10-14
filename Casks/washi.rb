cask "washi" do
  version "0.1.0"
  sha256 "21d637c43c0a531f97ec5db5ba602358a887a7c853302f2b37f6c7c367feb376"

  url "https://github.com/kiwamizamurai/washi/releases/download/v#{version}/Washi-#{version}-aarch64.zip"
  name "Washi"
  desc "Viewer and editor for Markdown, Typst, LaTeX and Mermaid"
  homepage "https://github.com/kiwamizamurai/washi"

  depends_on arch: :arm64
  # pandoc converts LaTeX to HTML; tectonic draws TikZ pictures
  depends_on formula: ["pandoc", "tectonic"]
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
