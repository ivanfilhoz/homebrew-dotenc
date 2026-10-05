class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-darwin-arm64.tar.gz"
      sha256 "dbd1eed268836aaa2fb0e6bf16d3d54f030ab7d8834c4dc743c35682062923e2"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-darwin-x64.tar.gz"
      sha256 "6aad72c7b13e54f159a72611b859e07492f2e65bcc103e5bfb21119d71b3cce8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-linux-arm64.tar.gz"
      sha256 "9bb3f412cb2a9c22eae05f1501fbe63c6d3977c707b13f6f2ad5516574865fea"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-linux-x64.tar.gz"
      sha256 "52c65e3ac4328815c62f5c388e4992d28a8a163ab14e0ec0b1103e2f9a41a135"
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