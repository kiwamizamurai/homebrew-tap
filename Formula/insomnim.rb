class Insomnim < Formula
  desc "macOS sleep-inhibitor CLI (Insomnia + Nim) using IOKit Power Management"
  homepage "https://github.com/kiwamizamurai/Insomnim"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/kiwamizamurai/Insomnim/releases/download/v0.1.0/insomnim-cli-macos-arm64.tar.gz"
      sha256 "8ab4293775aab50438ac9594fbf3577be192e4c39132423784bfa289cced5ed5"

      def install
        bin.install "insomnim"
      end
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/insomnim --help")
  end
end
