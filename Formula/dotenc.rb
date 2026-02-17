class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.6/dotenc-darwin-arm64.tar.gz"
      sha256 "148750a6273e081225eddceebc20c9f18e479945dffb5e80d3d37415831e7c91"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.6/dotenc-darwin-x64.tar.gz"
      sha256 "d7aad512a9ec7f00c05afe1346eb3dea09e01102b9b7dd08f502cb763bb2c3ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.6/dotenc-linux-arm64.tar.gz"
      sha256 "213646984737c38fc7d64e41dd3a896ae6609b029edb6fe54f9873b964e8c4e6"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.6/dotenc-linux-x64.tar.gz"
      sha256 "da406c3c1ab8633a29561e8b8ca3b93e8be10dde494c2473e3126b2ca38038e3"
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