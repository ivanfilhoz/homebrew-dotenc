class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.4/dotenc-darwin-arm64.tar.gz"
      sha256 "11961fabed1d7ff6d318adc8b9122eeffe6fe48c32f0daf8c5fadc7da11fd1ac"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.4/dotenc-darwin-x64.tar.gz"
      sha256 "0962324a2f2d2cc4f1ac5d2c6faca014c2b71db4e34392339dcfc041ac40407c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.4/dotenc-linux-arm64.tar.gz"
      sha256 "96a92d4100ab64e6add1444dc10c511730f8ddd5d3c578d070585e5dd1d14bc7"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.4/dotenc-linux-x64.tar.gz"
      sha256 "b28bece189973c22099a6ea0f4ca22d545840f19ec377be194d7498bc8e91232"
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