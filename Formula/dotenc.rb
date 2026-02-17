class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-arm64.tar.gz"
      sha256 "5ccf3eee57f5dd43fd15b40724fd12928d1e5b6a01931a25e26c8605fdcdad15"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-darwin-x64.tar.gz"
      sha256 "9d4a49949cdc24218e51df614e2db5af76949bc80324a3785bd0268efd94d50b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-arm64.tar.gz"
      sha256 "293f29bdd938648b88b55d4d7d2d95972a72a244c4c9a14ccd9b34794187bb1f"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.2/dotenc-linux-x64.tar.gz"
      sha256 "eaaff9c99853f416bdc3c21df73e7696ae89c8f9b4bcff1ace1a5f91edd46b9b"
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