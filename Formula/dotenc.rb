class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.1/dotenc-darwin-arm64.tar.gz"
      sha256 "02f2032036d88d09422eb84bf951dae63ec33eae9f511e2103991ed88c354a28"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.1/dotenc-darwin-x64.tar.gz"
      sha256 "1764bdfcbd10a2e90c9db68017d77f9272ee37f68535f4ac44c5ded2ecfaca1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.1/dotenc-linux-arm64.tar.gz"
      sha256 "ab4f6c976c83934eef01f989015063b56c1f890ee09f0319e8194c338af0d37c"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.9.1/dotenc-linux-x64.tar.gz"
      sha256 "27611acf8799e9e30edda449a2a5391a86c35415bcdfdc4cbc0b2e0f2496e075"
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