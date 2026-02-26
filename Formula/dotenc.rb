class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.7/dotenc-darwin-arm64.tar.gz"
      sha256 "a559a7e7b522fda717d15c89434792711b5e9f828731c07ce73f613a2709c11d"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.7/dotenc-darwin-x64.tar.gz"
      sha256 "fa6244f39f3408e3e76525e60c976ac3ec9987eaa774216e8d50025f439f7805"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.7/dotenc-linux-arm64.tar.gz"
      sha256 "ce34a1f995431ac3bce00fe82e53a964c9829cf8077131b8ef9ee69fb47ecdf7"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.7/dotenc-linux-x64.tar.gz"
      sha256 "e11063fc281e7ebfd6bf563f595a46c499934d21441d2ba32ed92d4b20212618"
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