class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.2/dotenc-darwin-arm64.tar.gz"
      sha256 "03d4aab495fbaf533c4661e51f01dad39eeb971510ec84b316d9fdc8247fadbf"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.2/dotenc-darwin-x64.tar.gz"
      sha256 "a4b3d16cc2f369b775458469fef9e3940fee0d449745c01bee9cda1b79e72a39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.2/dotenc-linux-arm64.tar.gz"
      sha256 "fc0e9c9c18e703a9a0d4836e6d74b6e4817b1481701c4280b94f5b474fab7167"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.2/dotenc-linux-x64.tar.gz"
      sha256 "021a17299f954797ca8093339ce6a5bc60ea050de46583ea03c23b3118d42697"
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