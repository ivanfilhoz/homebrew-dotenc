class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.5/dotenc-darwin-arm64.tar.gz"
      sha256 "95cbe57a9a352ab489346310355bd6d4f8226bff22211d85e22120ea1b48adb9"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.5/dotenc-darwin-x64.tar.gz"
      sha256 "5165a9cf1cff249ce879f7773db1e32894ea7e2b3fc2780d63abbc060c88c571"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.5/dotenc-linux-arm64.tar.gz"
      sha256 "0b81c6028025f12ce8454e49602337ac306dbf1b2bf9fc87ee9e691f2ac2405b"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.5/dotenc-linux-x64.tar.gz"
      sha256 "b61d27f569eeb0c527d5d0333ad23e1d57edb8980058b2b3dc9a758f246e9db3"
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