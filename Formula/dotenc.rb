class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.11.0/dotenc-darwin-arm64.tar.gz"
      sha256 "0e76f0fccf9e51a1d224c42fb137796cdae4ae03b765ca6daefa14a440cc794d"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.11.0/dotenc-darwin-x64.tar.gz"
      sha256 "c577c6831a2e5c1dfd5cca3b047b62daafe4523bca00b75beafbd910a82a09c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.11.0/dotenc-linux-arm64.tar.gz"
      sha256 "ae54cc6f04fcecaa6243b316d755435a3d0500e071db5d8f7f93747a076bae02"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.11.0/dotenc-linux-x64.tar.gz"
      sha256 "512b7622c07b829061b3b155e6c10158faa53e50fafa2c3b99f131f089b72f6c"
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