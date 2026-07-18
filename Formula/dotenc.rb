class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.10.1/dotenc-darwin-arm64.tar.gz"
      sha256 "534a8ebfd79416c8e4c5fbeef20cf7e57e0f9db2bbaac8075915bdaa0ea1c829"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.10.1/dotenc-darwin-x64.tar.gz"
      sha256 "32b251a89dec84405108e91847177d9ec9ae8ae4490ccd035e4e7d317d00c735"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.10.1/dotenc-linux-arm64.tar.gz"
      sha256 "90f50d4b6e1bf4915bc27df57bb55e144e1599a535690075d8e60370ca7de5e4"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.10.1/dotenc-linux-x64.tar.gz"
      sha256 "18900f395b01c3b724b5198847eb04d620d994ccb7d0199e80c27c6c4aefce9b"
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