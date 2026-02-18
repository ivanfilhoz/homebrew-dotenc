class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-arm64.tar.gz"
      sha256 "d6794dde4bc4beaeb649d24be50898964434781998f34fb297a3810813c69f39"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-x64.tar.gz"
      sha256 "591b25fd96fb69e9e4d846c7c97d8a899f95858c7db2081ff42714476c383017"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-arm64.tar.gz"
      sha256 "9a420b27cf6e50618390e72d9acc9b59ef5821c2583cf7e1417153884532278b"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-x64.tar.gz"
      sha256 "b9b9af714d00d2400701d065235d7dac87fb35512c3ebc809d1fb34c703b816f"
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