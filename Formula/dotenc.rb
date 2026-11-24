class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.6/dotenc-darwin-arm64.tar.gz"
      sha256 "7a7a5b6a4c35ebb8b54d3785084cf2273303cdc8fad4279d57cc5cb1b826c62f"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.6/dotenc-darwin-x64.tar.gz"
      sha256 "e22e5975b053603e4b8eeee384f9663d7d13aa8649c0a2df2796b60f7877fb98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.6/dotenc-linux-arm64.tar.gz"
      sha256 "920716cc4b5a7dec322f20908ce13c93d36008510e2683e3f340f8e73ffbacb0"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.6/dotenc-linux-x64.tar.gz"
      sha256 "b4d64ad2cfc6e30e4a01740d85e287cb0b5b77e2f927745f2b74fa541a323a0a"
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