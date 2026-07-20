class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.0/dotenc-darwin-arm64.tar.gz"
      sha256 "ea767046d081a894c8136cfd6792910ffee4ef1dd207866525720d500459407a"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.0/dotenc-darwin-x64.tar.gz"
      sha256 "6b210c16e71e9cf4ea715ba4a7ff2685628c31402455e9a2ca229d5da338ccc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.0/dotenc-linux-arm64.tar.gz"
      sha256 "933a0771806fdcd3e0e45c3ea757f32bb687cea3ed0287a28ad905b682ad307b"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.0/dotenc-linux-x64.tar.gz"
      sha256 "55c9b54d87c543ff1f0f02e518f310e9267bec87ccc7d8e4252ca9120426d12f"
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