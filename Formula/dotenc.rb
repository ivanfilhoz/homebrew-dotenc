class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.0/dotenc-darwin-arm64.tar.gz"
      sha256 "036c075ec02566e1e3fca1c6cc1a8c33670b4a7d8455173b29a33186354e261c"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.0/dotenc-darwin-x64.tar.gz"
      sha256 "0faf00e351152af0f7581838fecc0278b0095292aeda9245b7f83a43830649d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.0/dotenc-linux-arm64.tar.gz"
      sha256 "d91ecfe6d1aa4c6d777bbedc9bd16a3f6b6b84a62d6b5845ac062239743cc51a"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.0/dotenc-linux-x64.tar.gz"
      sha256 "791c7a1de9bb34d82d90861fd465b9b4d919439443d070a7d7c248d33685f5ac"
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