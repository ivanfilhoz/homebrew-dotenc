class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-darwin-arm64.tar.gz"
      sha256 "3991a636858332f92b92b3633d198fe9ea35fcb7d3194393c4cf3ea062b4378c"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-darwin-x64.tar.gz"
      sha256 "3fc2bf96f3390dfe5025a1eaefc5a619e232bd0c0f0ca7c40e89745c4d26f0a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-linux-arm64.tar.gz"
      sha256 "53aa6478886faa4ae9ecd050b4b661ce13f52fe1280ba4130d27d37fc5689ef2"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-linux-x64.tar.gz"
      sha256 "6ab4ba51702d60b7c21e0178b58cacf39aa3fe5860ad951589d7736a6cbf74bb"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotenc-darwin-arm64" => "dotenc"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "dotenc-darwin-x64" => "dotenc"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "dotenc-linux-arm64" => "dotenc"
    else
      bin.install "dotenc-linux-x64" => "dotenc"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotenc --version")
  end
end