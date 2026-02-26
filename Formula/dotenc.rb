class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.1/dotenc-darwin-arm64.tar.gz"
      sha256 "faa214760c5b18d83b9d0056e2ca6c3ce5ee4e53af0f0d5dbd8272deaaf54239"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.1/dotenc-darwin-x64.tar.gz"
      sha256 "d6de4499c903974227558fe0c16c1e8a11ee787a9bb7339dee110f77dbcc735c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.1/dotenc-linux-arm64.tar.gz"
      sha256 "cc1dc55211d3cf1db20dc119f53b42c1340509bf298e9cc296ef06e8961ce4fb"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.7.1/dotenc-linux-x64.tar.gz"
      sha256 "8d72de2c1ac716d6c67386904b77d2028dc38f24e690e54a2890d767a7570723"
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