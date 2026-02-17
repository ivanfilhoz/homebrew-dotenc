class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.3/dotenc-darwin-arm64.tar.gz"
      sha256 "3ad2cdfefcef16b17a37b35da01f4d9debf6db68af6f06011f2018ccd542eaad"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.3/dotenc-darwin-x64.tar.gz"
      sha256 "9be984180b707d231771387b7842df7390b79063ec2ae57734297f9a4f884d64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.3/dotenc-linux-arm64.tar.gz"
      sha256 "e013c880a31510a95722acbc7ab08a27a8220abf796e94d7b8208e2835b98445"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.3/dotenc-linux-x64.tar.gz"
      sha256 "818bb38783e1817d04ac03a76e27ccc3586cdced7730ffaec764a5e4f39b107c"
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