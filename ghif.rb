class Ghif < Formula
  desc "CLI tool to fetch GitHub issues and save them as Markdown files"
  homepage "https://github.com/kiwamizamurai/ghif"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-x86_64-apple-darwin"
      sha256 "INTEL_SHA256"
    else
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-aarch64-apple-darwin"
      sha256 "ARM_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-x86_64-unknown-linux-gnu"
      sha256 "LINUX_INTEL_SHA256"
    else
      url "https://github.com/kiwamizamurai/ghif/releases/download/v#{version}/ghif-aarch64-unknown-linux-gnu"
      sha256 "LINUX_ARM_SHA256"
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
