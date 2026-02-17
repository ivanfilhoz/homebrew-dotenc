class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-arm64.tar.gz"
      sha256 "29e898f6186ba6ec9e7acc770ba5147c65209cfdf90148e7a70037b37f5d61d2"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-x64.tar.gz"
      sha256 "0342d90a42399b72ec0f9f861feb4a6c7fa614ce2a652b8fd1edab6041b3e67c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-arm64.tar.gz"
      sha256 "ac229bc3866020870cf19e04ac90d310674d58ffaec3c717494e96bbbff32dae"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-x64.tar.gz"
      sha256 "030d1b57cee8b0e36977c6ab70e6f7a1b0709980674aae00723ca188c4d26465"
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