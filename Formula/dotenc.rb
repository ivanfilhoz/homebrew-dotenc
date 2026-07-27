class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.3/dotenc-darwin-arm64.tar.gz"
      sha256 "f6c87b7492f7680781d74c942545e0c36872a0793b25e64a97350c879d528fd7"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.3/dotenc-darwin-x64.tar.gz"
      sha256 "fac535f2beed25f6d39e58f9e8fca794e0ed482fd59ab8906fd1651bf4791fbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.3/dotenc-linux-arm64.tar.gz"
      sha256 "1dfcbba643ab321d363b8087a3fffcf0e018b551ea8ce65bb5e5696917cdc1da"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.12.3/dotenc-linux-x64.tar.gz"
      sha256 "3a906c3cb958950d98097de4c6c0aab282b9ff0b58ce91a8a7fa5e2c48c37fe0"
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