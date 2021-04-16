require "formula"

class Pruney < Formula
  desc "pruney is Aardvark's CLI"
  homepage "https://github.com/aardlabs/terminal-poc"
  url "https://github.com/aardlabs/terminal-poc/releases/download/v0.7/pruney-darwin-amd64-v0.7.zip", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "c4bb34abd18ef743572c085fcbaf0a4d5c0770a7c889ae5ce422213bb35e80d4"
  head "https://github.com/aardlabs/terminal-poc.git"

  def install
    bin.install "pruney"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.7", shell_output("#{bin}/pruney --version", 2)
  end
end