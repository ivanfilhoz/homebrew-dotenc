class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.1/dotenc-darwin-arm64.tar.gz"
      sha256 "f226659bea51c0e2c4f4632b481b1c752e1ee541eeeb7eb2789056c185f31a73"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.1/dotenc-darwin-x64.tar.gz"
      sha256 "4ffd025251e4ba04dc3a5ebac3910249dbe01b5984ac76b65d72ad065cef7fed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.1/dotenc-linux-arm64.tar.gz"
      sha256 "ea90b80411e661c159378b9bf6c3523d0a5433f3aaf92ac8974529d5ec77970b"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.1/dotenc-linux-x64.tar.gz"
      sha256 "b23984eb2ce22e880cc278417a44ea2a65bc9e763caef0bc744d74d5f0b3e4c5"
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