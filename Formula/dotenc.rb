class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.1/dotenc-darwin-arm64.tar.gz"
      sha256 "09030f443e72fce293f59f4896971140a4187a230cbf36d6b91aa5d3923c1d08"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.1/dotenc-darwin-x64.tar.gz"
      sha256 "f77ef1a258507ff594e2cfa40f37ee6a39121a5fbbc7275ffc839a0866f97560"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.1/dotenc-linux-arm64.tar.gz"
      sha256 "a8a32fd2a4f200d9a614f7627d087568665f576ebb51ee74ab630b6444b54fa3"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.6.1/dotenc-linux-x64.tar.gz"
      sha256 "f3a46eb011598adf62e674fdfd14cbf47344271cbff5c895e8ec46ceedbcc660"
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