class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-arm64.tar.gz"
      sha256 "4c521b0587d49a664d02bf7e9bd0a8de8246d1788483f8896c52069d78794d39"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-x64.tar.gz"
      sha256 "3ee56946ae289fca897e13da33dfffffdaf4cbfa7fbf4edb32d03fbd5805c515"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-arm64.tar.gz"
      sha256 "e156fc5a26a31cb2da68705dc828f7e328d862baa5904a8bb4d912e74de8fb56"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-x64.tar.gz"
      sha256 "38bfff01244bd698b145768db1de7bcf595e7796f1918fffdf3810f1a56523bc"
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