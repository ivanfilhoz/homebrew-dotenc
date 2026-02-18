class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/ivanfilhoz/dotenc"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-darwin-arm64.tar.gz"
      sha256 "764ca7032ba48108fa3a4d026b8c504cc221c64cfc04734a7e9bb25d8f3bb6c1"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-darwin-x64.tar.gz"
      sha256 "f1d09aecb4f8158389d6376d4324b57b31ac128da05fe47350017aa3753b29d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-linux-arm64.tar.gz"
      sha256 "cbe7ee95583061157f5b672774ecccb5b0ce537359cb0136db55203f5292f185"
    else
      url "https://github.com/ivanfilhoz/dotenc/releases/download/v0.5.3/dotenc-linux-x64.tar.gz"
      sha256 "785262c74d16ff46c93700911f4ce861358067f02ec4d357d08a57ec112c602f"
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