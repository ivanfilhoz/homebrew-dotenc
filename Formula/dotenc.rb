class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.0/dotenc-darwin-arm64.tar.gz"
      sha256 "8fe4c42202c1a665f69b18618ad1f42a8a5410e5b0ee9ed6fa66107dd20b0cb6"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.0/dotenc-darwin-x64.tar.gz"
      sha256 "1d273b176a9e8c82f431461d3bf36efbb48c2401b8afc87bcbecfc3a4184c19e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.0/dotenc-linux-arm64.tar.gz"
      sha256 "f4d3b20faeae7124c738561947aff7862125f583a31db6d0bc91bdd0edac3a4b"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.0/dotenc-linux-x64.tar.gz"
      sha256 "6e97b5517586ccd9854d88faec922a5f176cf6edf423e297cea05a3a33817d7e"
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