class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-arm64.tar.gz"
      sha256 "f6a1714dd79e3a89f6ec4d44c36d40fc4593060dbe8ebe9100d9fe7e2d4e0a67"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-x64.tar.gz"
      sha256 "a8b0395bf80cf1abe38372c8e76c8ba5ff1f1dc8e36509d02427ea6dee73a63b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-arm64.tar.gz"
      sha256 "2e91e6b9798311c806d5914e3b4492f4ae2b57eae9eea8ae1aa4e308c7debb2e"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-x64.tar.gz"
      sha256 "8211ab5113bea9a3e21e4ea7353dcade628facb4f7448d6954866b4d4e85f567"
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