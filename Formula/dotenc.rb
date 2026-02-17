class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-darwin-arm64.tar.gz"
      sha256 "08c7626d31d1a3ea37e36650d5702c9e1280dcc76d98f14272c4ada297827f28"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-darwin-x64.tar.gz"
      sha256 "88ff65a255c7434455709e4a6d10c941e775ee009a632632948e42272702ac0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-linux-arm64.tar.gz"
      sha256 "19480b8a54e14ab6707bc3e9a355d42d363adea7ae6c8e8f938273e5c7f5d095"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.1/dotenc-linux-x64.tar.gz"
      sha256 "ed82ebc01bd8b3df5106f006d98bb5380fdb7850dcae065c5d5799b07f897f52"
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