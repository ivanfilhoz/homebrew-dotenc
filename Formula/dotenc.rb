class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-darwin-arm64.tar.gz"
      sha256 "1e8cfe60804a09957937212053ee8cd50967cbb424375cf71b781eba007304a9"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-darwin-x64.tar.gz"
      sha256 "7fc6c1950ead4bfdfdf4d064405230ed9269c9800fd4469d0dc8a089b9584626"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-linux-arm64.tar.gz"
      sha256 "b00f4c773552c276d16d1757c1f507cb0ae29ef877729d5474a3c6ca85e7cc33"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.0/dotenc-linux-x64.tar.gz"
      sha256 "8704eea83d56070e1d04b20d738b970f0fc9039910c2ad052dce885f06d2c413"
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