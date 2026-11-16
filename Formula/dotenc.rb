class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.5/dotenc-darwin-arm64.tar.gz"
      sha256 "056e78fae970dfb57dd11fc7536779cdd5e87c3dba206e6626b8e72c82ef9c96"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.5/dotenc-darwin-x64.tar.gz"
      sha256 "8f877c3d9e48baec06c5131767c659b3c1f21bc54efd1ab5394f42f82b8bfacd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.5/dotenc-linux-arm64.tar.gz"
      sha256 "1a83e9b71d9771eaa391329854a3d3c054ec51f77240fdd835879fac0f62c79e"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.5/dotenc-linux-x64.tar.gz"
      sha256 "18e4168d88e0b83519ee7f91b17277f4cbf4fd873ae44c94623c7df8484205c3"
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