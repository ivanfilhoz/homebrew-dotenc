class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-darwin-arm64.tar.gz"
      sha256 "56c99cd7dc428f9d8511a3404d7b88e52d35fd1d52e3ada2b48abdcc277f8782"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-darwin-x64.tar.gz"
      sha256 "770b441f3d8968eafaacb1caaf3334c6ba9602591ac2090b837d4851300933d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-linux-arm64.tar.gz"
      sha256 "0967925ad700bd3327666f56def0b6097d6e7d2a54ef28e346c12202cdc2a4e8"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-linux-x64.tar.gz"
      sha256 "63b6b9080bee258835bc0b0e2cd08ff018cc02af76f926dc5a6d8446092a84c0"
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