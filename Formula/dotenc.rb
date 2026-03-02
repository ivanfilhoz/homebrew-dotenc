class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.8.0/dotenc-darwin-arm64.tar.gz"
      sha256 "3e99b87fede469d5cfeb801a7e79fe838009afa373b64431825e0588874dfab3"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.8.0/dotenc-darwin-x64.tar.gz"
      sha256 "dd4b34bc0824552680d62f781b3494a046baddae1fa4bd66c3a987171c9cb174"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.8.0/dotenc-linux-arm64.tar.gz"
      sha256 "d0e21e118bd4268908c4628944505c6e96c1e643afadb6fe7fda5418f453cc83"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.8.0/dotenc-linux-x64.tar.gz"
      sha256 "f385a2e28acf46009370d55163f4a3f60edc95e92f26b95db4ca19de02570971"
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