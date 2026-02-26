class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.6/dotenc-darwin-arm64.tar.gz"
      sha256 "6bad66178542efaebce47de35dcf24e7eae706d38235990ec0e71d9aca18b3b7"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.6/dotenc-darwin-x64.tar.gz"
      sha256 "40921ec8037fc04c14f64756128213e2361134b3e3ff7b78b3463f39af476fc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.6/dotenc-linux-arm64.tar.gz"
      sha256 "065546fdca5836d0ac5673c99bc8ac286b72ec946f8d234c23190c5e5575d266"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.6/dotenc-linux-x64.tar.gz"
      sha256 "7595c2a2443d83500cdce200a1b939b7414ab90bf915bef0f1ad93f989e90afa"
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