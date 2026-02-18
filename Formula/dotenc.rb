class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-darwin-arm64.tar.gz"
      sha256 "53711c3b7b24c2763d06d35dc3594b9aa0531b911c678f9be8f4947fb3430258"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-darwin-x64.tar.gz"
      sha256 "313f7fdb95e0de97005a69c365d19cb14b275f1ef4aecb117bb4612f1fb74c8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-linux-arm64.tar.gz"
      sha256 "73d49380c8a69e85383fc2327a7175cb2fc1f7e52d6e560c7222b1722a85c98b"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-linux-x64.tar.gz"
      sha256 "9f8623e0ffea654c7c26f855f95fc1f1a0ad71c0affbdd023bf54f0cadef7d36"
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