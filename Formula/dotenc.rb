class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-arm64.tar.gz"
      sha256 "5667a6343fe9ffeaf81013cc5c824ce39b054e7f81061f820732b3e135f14722"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-x64.tar.gz"
      sha256 "b95216428ccd1f1cbfb246005f5fe25b69d037720204c7dc1c4a862ba5bcf572"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-arm64.tar.gz"
      sha256 "a99e3d8c1753f3ee9db6461ad5d0d61cb1b69474116e8a0e05de26c539e29884"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-x64.tar.gz"
      sha256 "c1784aa4d4944962277b12ffa79e146b0d72e0aaa03db208d9e79e3a42a2dfec"
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