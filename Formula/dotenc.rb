class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.2/dotenc-darwin-arm64.tar.gz"
      sha256 "1b1a35b40229c8bab3caecc07e3499fcc0bd6a184a6764716a8b14da06460b89"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.2/dotenc-darwin-x64.tar.gz"
      sha256 "e2ffbdc80c90158626fdf7a091efad51dab3393d54ee21718ae3b5e1a8f1a58c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.2/dotenc-linux-arm64.tar.gz"
      sha256 "a805ef301f495be5bb39af4793a27200329f7adf302c63dcbecd05ac52ae2e75"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.2/dotenc-linux-x64.tar.gz"
      sha256 "11094a88190fdb47e9b1213043a53e07e554e2c34506983ab861d71ae4929226"
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