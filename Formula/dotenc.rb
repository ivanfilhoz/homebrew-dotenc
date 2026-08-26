class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-darwin-arm64.tar.gz"
      sha256 "b99920590bad4f484f5941e13299f4f85bcbe2f4801d0b4e0c7ba633078e3f29"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-darwin-x64.tar.gz"
      sha256 "eeafee448c86b28e11fb0cc40fe9b7403b7e45b1eeb96c7502743d7e035bb547"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-linux-arm64.tar.gz"
      sha256 "31f43d810b9b06f9af28f95d17301673be10bed948967b0c5726b26a925552ea"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-linux-x64.tar.gz"
      sha256 "bd562ea4f060464b65f270378b2aeda8ae558b55312253bf8af68ae6d43131fb"
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