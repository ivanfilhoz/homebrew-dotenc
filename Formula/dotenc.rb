class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.3/dotenc-darwin-arm64.tar.gz"
      sha256 "e508e6b0042038b494e3ed3bc8810636f30ed56f440c3c5e3b8fb64021391c65"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.3/dotenc-darwin-x64.tar.gz"
      sha256 "338bd831b45497ae69b520f577f0efb659479cdff67599805b2369c785968f04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.3/dotenc-linux-arm64.tar.gz"
      sha256 "3df44eafb30e12dc9f2997de42611bdbaf4b0d0d21a5df68c4f62d8c9f05366e"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.3/dotenc-linux-x64.tar.gz"
      sha256 "a0c7ff80d93cebb1cd9f3673f0f5d77a273f2b8d05e8b98f4b2f128d26e5be60"
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