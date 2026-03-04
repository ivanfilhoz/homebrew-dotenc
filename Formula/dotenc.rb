class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-darwin-arm64.tar.gz"
      sha256 "4a74c774717f24cf07c8ae3be145195b2ae8169d50691bafd0ef857cdcf6c5bf"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-darwin-x64.tar.gz"
      sha256 "aa10e52470a79a590204556193ffecf28f4a0b01fc18ff0f0cfaf91f4563a77a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-linux-arm64.tar.gz"
      sha256 "5dbaf7205e94024c9bc522278bdb1a1db4bc009ddebb623ebe292bc2cc1baa1e"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-linux-x64.tar.gz"
      sha256 "33994ba3bb50dfe91f6f5ebf961ed00e5190cc3852319b4a4f5f45b6e1699fab"
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