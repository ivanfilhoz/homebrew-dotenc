class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.3/dotenc-darwin-arm64.tar.gz"
      sha256 "281eca668d0145985db74ed9e79122a85c6ecda146cc5696753fd2c4f49134d0"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.3/dotenc-darwin-x64.tar.gz"
      sha256 "7a874554b0a5d919846a096ce9dc13211995c15bfe1b9fd9e8b59478f2bca9f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.3/dotenc-linux-arm64.tar.gz"
      sha256 "1ca495d2cf64bf3acd10170d2eeb95729b9b84636fd8f0a26b68b525738ca708"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.3/dotenc-linux-x64.tar.gz"
      sha256 "3f54375a9e76d6e60de7c60620e4da5fb44241c4b2cfd18fa638599b87f5f371"
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