class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.1/dotenc-darwin-arm64.tar.gz"
      sha256 "750f4c4ec196f9450033d16301f7ec327f8df00f8ba3e7fc59949d52384f4a0a"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.1/dotenc-darwin-x64.tar.gz"
      sha256 "a7d14db3980e7f65f40c74a13ecf2006d578a7411405e8e583115de43a2815f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.1/dotenc-linux-arm64.tar.gz"
      sha256 "e261dd5424d93dd9541884a3aa5a97c59e0dda8b0a9ba256e142ddf119e01261"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.1/dotenc-linux-x64.tar.gz"
      sha256 "64ed932115101699fac2b22bf8c5fb292b237f7480a94e5bfcaba1d0812f9a36"
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