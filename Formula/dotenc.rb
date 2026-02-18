class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.0/dotenc-darwin-arm64.tar.gz"
      sha256 "cf453eb95fb9c90391f25a2043f2bb487d9d0cbfdf74c2e6e655f47084bf1cdf"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.0/dotenc-darwin-x64.tar.gz"
      sha256 "2c02506d40cc653e9187243932aa327233e6d1a98f4818fc637bda31af4fc8d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.0/dotenc-linux-arm64.tar.gz"
      sha256 "95f872daa65f7ca9aab4d8ee22c4a483abcde1b0e71da0878fd92b6b629eeabd"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.0/dotenc-linux-x64.tar.gz"
      sha256 "6d7fb72efb7ea0a7df8a643596af33f29a89c1ecf8d94b3ce15fe11c9028e0bc"
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