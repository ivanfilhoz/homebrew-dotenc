class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.5/dotenc-darwin-arm64.tar.gz"
      sha256 "dd368abe5fe54c19950290834a290ace0b62a67ddd7b5b7abe6e0250bf0cab83"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.5/dotenc-darwin-x64.tar.gz"
      sha256 "6815eb521cc4c28b261c84617211a696c95be0683537462c284b2cc703792bf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.5/dotenc-linux-arm64.tar.gz"
      sha256 "c705aa9b722d6e9dd6df6a7d0d91887bfeb6c46c61d6459e44d9a446e84845d9"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.4.5/dotenc-linux-x64.tar.gz"
      sha256 "fa1c9b489f5811d23026a8559cafe1ec6d3223cd1f68b5312843821301c956f3"
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