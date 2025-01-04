class Ghif < Formula
  desc "CLI tool to fetch GitHub issues and save them as Markdown files"
  homepage "https://github.com/kiwamizamurai/ghif"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-x86_64-apple-darwin"
      sha256 "b53ee1f60db5f2e29e8bc325c1e43e09ee849a22d177eacd0e70e63e11f100bf"
    else
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-aarch64-apple-darwin"
      sha256 "b7e50b11cc7eb205334e3d610db96cafadcc338c08c8b69fc5c5b9b9e8646902"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-x86_64-unknown-linux-gnu"
      sha256 "8f4b7cd4c2d738dd301c8c342d7371cb380cd43d0d17b70d0623f8d95aeda762"
    else
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-aarch64-unknown-linux-gnu"
      sha256 "5cb33754bc031de5284c294412506ee0cfa557017cec1310edc78dcf6aeaaafd"
    end
  end

  def install
    if OS.mac? || OS.linux?
      chmod 0755, Dir["ghif-*"]
    end

    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "ghif-x86_64-apple-darwin" => "ghif"
      else
        bin.install "ghif-aarch64-apple-darwin" => "ghif"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "ghif-x86_64-unknown-linux-gnu" => "ghif"
      else
        bin.install "ghif-aarch64-unknown-linux-gnu" => "ghif"
      end
    end
  end

  test do
    system "#{bin}/ghif", "--version"
  end
end
