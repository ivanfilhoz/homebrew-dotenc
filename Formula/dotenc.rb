class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-darwin-arm64.tar.gz"
      sha256 "21a4982799b082f8109f948216ed56b1d66329629ff3792c6f819487c3d849fe"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-darwin-x64.tar.gz"
      sha256 "0e1bd27d5a1009188c69ce449fd7c91990c5ff73fbcc47f368d1fb4c846b9969"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-linux-arm64.tar.gz"
      sha256 "a650e4742d382c803be4686a3c43b6efdd0cb1b04664ad8a255d99e76dc1d4fc"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.4/dotenc-linux-x64.tar.gz"
      sha256 "0c2cd39a81e134c1331cde0189236955fd156999edd6e3ec667629dc5dd06d13"
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