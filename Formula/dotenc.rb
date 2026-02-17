class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-arm64.tar.gz"
      sha256 "11eae25fd20daad298b6451a4bb0200fb1f11ce3d950d65bf884f2c0e21a95db"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-x64.tar.gz"
      sha256 "f6d88248151f2065dcf8cb85b502f2890939e3113c7c62805029481b97df05c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-arm64.tar.gz"
      sha256 "5f8f4e2687bbc85841d79fcac3ba77c74e85a4d41c04047ac4cb4947ef92988a"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-x64.tar.gz"
      sha256 "ba6a0d549e3941b40dc13f9348b0d791df3f4004d7fa04407372d28bce22535d"
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