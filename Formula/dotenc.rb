class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.2/dotenc-darwin-arm64.tar.gz"
      sha256 "7a177cb6d26c141f8bf7979f2895fc58ff8bf42eb0730ca8cf56bb5fbf9fe13a"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.2/dotenc-darwin-x64.tar.gz"
      sha256 "541aa3904351aa7f30a32e361ad1b42afc29598eb8e017767b027769de80550b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.2/dotenc-linux-arm64.tar.gz"
      sha256 "dbaeaf5465c46e1d10b07b6690195274e59e7469bcca64dc19f5dd6ecb684726"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.2/dotenc-linux-x64.tar.gz"
      sha256 "8656f45395b78bb1ebb3de6ed11ce0bd3c98243e2b2648c346060a4c6ea58076"
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