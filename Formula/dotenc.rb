class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.0/dotenc-darwin-arm64.tar.gz"
      sha256 "87d77f9f26c31a55c8cc1ebba0560e7f86530fa63f8e30d7d9d76dc494189f67"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.0/dotenc-darwin-x64.tar.gz"
      sha256 "5491b3f52afa8d528164b07bcba4f279b9febfdb0466b102d8c8698cafc918c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.0/dotenc-linux-arm64.tar.gz"
      sha256 "2a3ba78ab97300e41cc501da0cfb2893ab69c5ca3227c0a6ca73860c9669c26d"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.0/dotenc-linux-x64.tar.gz"
      sha256 "2f590f00710a737ae981d1de3cf65610f0c329a4c11357126adeb30c70e6259c"
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