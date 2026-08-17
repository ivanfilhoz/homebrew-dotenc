class Dotenc < Formula
  desc "Git-native encrypted environments powered by your SSH keys"
  homepage "https://github.com/dotenc/dotenc"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.0/dotenc-darwin-arm64.tar.gz"
      sha256 "11e2cf49338bd612a4f21286e78bf8da647eae62ea62e1d148dc37fb0c7b82cd"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.0/dotenc-darwin-x64.tar.gz"
      sha256 "fe6fcbed8e435f5a08e80efcc4d656ec7dec7d548785dc6da4534fa8960e72f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.0/dotenc-linux-arm64.tar.gz"
      sha256 "9faae2d57e94dc03441b56010c3e45d3c0c866c6b313f67a1153187d78e55b54"
    else
      url "https://github.com/dotenc/dotenc/releases/download/v0.14.0/dotenc-linux-x64.tar.gz"
      sha256 "9df3f8d47164b6194e51957980b217c8f6ba8f0d803e03e4ddfb041b4c2bd2b8"
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