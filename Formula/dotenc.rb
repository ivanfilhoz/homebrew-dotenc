class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.15.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.4/dotenc-darwin-arm64.tar.gz"
      sha256 "5ee465685d7ff4827defeacfbcad91a67cfbfe7d4a4e051d87be1bd8f511edac"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.4/dotenc-darwin-x64.tar.gz"
      sha256 "2fd3da16e0118da462fca5dfa3bab220fe55845b977cd141ec03b6037ad15633"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.4/dotenc-linux-arm64.tar.gz"
      sha256 "827d126f2af14fe4924235208e8fc099ab4b143f9423bae68252846ede225291"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.15.4/dotenc-linux-x64.tar.gz"
      sha256 "d1f85f99965a913ac3e41bf085a163f529eb0caff9adc011100771adc7385ee4"
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