class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-darwin-arm64.tar.gz"
      sha256 "dec0c3862e1a35bb21ee0c7f6ed659305ec942937252a956d83d4e04dd32dbc1"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-darwin-x64.tar.gz"
      sha256 "04e31e3f212a80f2e50e4f2e146b09f80c9a9aa812e46cab3d81eb1b38232ef6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-linux-arm64.tar.gz"
      sha256 "070edbcd8005cfa4303ba19f8f2c4dd890701b70f73fa87c66b426811058cfde"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-linux-x64.tar.gz"
      sha256 "86498e85c8b3188d31a0711b447d5a5e4377d899c0a5e6fb097e56764b895611"
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