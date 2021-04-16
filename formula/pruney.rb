require "formula"

class Pruney < Formula
  desc "pruney is Aardvark's CLI"
  homepage "https://github.com/aardlabs/terminal-poc"
  url "https://github.com/aardlabs/terminal-poc/releases/download/v0.7/pruney-darwin-amd64-v0.7.zip"
  sha256 "f275f5f910ec11d9d169239cc25a0a214b057553bf1d3c13674f1cc674779497"
  head "https://github.com/aardlabs/terminal-poc.git"

  def install
    bin.install "pruney"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.7", shell_output("#{bin}/pruney --version", 2)
  end
end