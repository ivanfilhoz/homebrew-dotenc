class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.2/dotenc-darwin-arm64.tar.gz"
      sha256 "c4c33044a9cabf18595fee3f42ec3ca437180d0eda3d7dd630306af0429dd348"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.2/dotenc-darwin-x64.tar.gz"
      sha256 "096d974f388c4d2391b87d597a67d08293dc685bbc08ffa013f714bba7300e8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.2/dotenc-linux-arm64.tar.gz"
      sha256 "b502840062dfa1f25db7f8766e349400b409e4abdfb347607ad37ff5bb8942db"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.2/dotenc-linux-x64.tar.gz"
      sha256 "6db17184a44bfaafb79f02d86e447c4898dea5265c27b35e4dbfe03c2870d33c"
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