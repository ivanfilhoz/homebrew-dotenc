class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-arm64.tar.gz"
      sha256 "9acd9593e864876d413b860e567fadfadeb6b082c99e5a8c629645b3084208e4"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-darwin-x64.tar.gz"
      sha256 "59e4701f7f333b5a28f82db5846f03c0b9080661a36f21977d3a2a69c9930d81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-arm64.tar.gz"
      sha256 "b0428912dce3cfa09f17bb327e63dbd41326c43e619ed5ff42e9eac8b8b24848"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.0/dotenc-linux-x64.tar.gz"
      sha256 "405b108c7062e4aa0f348ac845b788e204ae5d9754adc006af1d6a89c04aaf7c"
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