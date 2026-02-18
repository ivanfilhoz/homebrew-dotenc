class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-arm64.tar.gz"
      sha256 "fdaa57ebbd808b709da6de0caccc8da8f2a4f3cf6e272e577eb347345d969e36"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-x64.tar.gz"
      sha256 "27143d4a4f2d719b7566e473134315c7a4d14f7e6f855851836d454558e373bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-arm64.tar.gz"
      sha256 "b5ef1f58ad1562b53076f9ffd7c527a08f56490940db18e20dda1bbda1a555d9"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-x64.tar.gz"
      sha256 "23c216e2b281e9105684b55463180dffaef618a913cd597ad216eb9b97592aa9"
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