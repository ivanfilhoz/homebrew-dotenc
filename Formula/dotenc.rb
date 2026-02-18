class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.2/dotenc-darwin-arm64.tar.gz"
      sha256 "b5582f10c26913a1cd21e5437bd330e3b56d56a0d17f1d9c7163b6b08473ca47"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.2/dotenc-darwin-x64.tar.gz"
      sha256 "a89dc008f3659e846c57ca634a17bdde2d76dd2a821160c06d0aa2ba30b55b6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.2/dotenc-linux-arm64.tar.gz"
      sha256 "a3d43296455fe90c0950bf5541ec9e91bdf337c48396b284d4ad168df353399e"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.2/dotenc-linux-x64.tar.gz"
      sha256 "9e6e6ef957c6681d725abbdf15cf47382e8f7cac0774190226c2262ee1ca6006"
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