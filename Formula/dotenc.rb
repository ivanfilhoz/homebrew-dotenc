class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.2/dotenc-darwin-arm64.tar.gz"
      sha256 "b7f65f4569819c992f8b8a2eb53527f5b0485bdd19a2ccab4f10d0e79559ec36"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.2/dotenc-darwin-x64.tar.gz"
      sha256 "87c4c80943b0fafd9b8ed1561cf28cd92e04e8073fc66f542aa25ca129111d26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.2/dotenc-linux-arm64.tar.gz"
      sha256 "427341ccd16528a8e5c7d3cbd292d315e1f6f5b804d2eea432e4c517542b2540"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.2/dotenc-linux-x64.tar.gz"
      sha256 "f3d89b14d02116e54efb029d2a69e5a10d901d9807147349fa8a35fc41a0b762"
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