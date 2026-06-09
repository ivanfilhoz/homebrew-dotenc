class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.10.0/dotenc-darwin-arm64.tar.gz"
      sha256 "2d80b3743c5faf7e0ef2248b2f1e77ed82ee5b81fdf7dd3a331a032a42adfbf5"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.10.0/dotenc-darwin-x64.tar.gz"
      sha256 "742de051ccf09bb9b288dd8b19b724e0d9a871f7f39c94cd6148b5b1c2611eb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.10.0/dotenc-linux-arm64.tar.gz"
      sha256 "b806720e1fed4d3d9702d5ab59359a750debf907c1da5320bee9ba690ad93308"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.10.0/dotenc-linux-x64.tar.gz"
      sha256 "3637ece9c185afce476ae31dd3f547565d5452258afb76d3ce8b0a9d1ce13c91"
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