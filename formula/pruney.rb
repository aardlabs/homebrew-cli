require "formula"
require_relative "lib/private_strategy"

class Pruney < Formula
  desc "pruney is Aardvark's CLI"
  homepage "https://github.com/aardlabs/terminal-poc"
  url "https://github.com/aardlabs/terminal-poc/releases/download/v0.8/pruney-darwin-amd64-v0.8.zip", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "d15f7e3a6732247959ef0f2ba7a34657b7a9b309ddc54ebc8e78f170230dca36"
  head "https://github.com/aardlabs/terminal-poc.git"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"pruney"
  end

  def caveats
    <<~EOS
      To allow pruney to capture command history for the bash shell.
      Add the following to the last line of your bash_profile or bashrc --:
        source #{opt_libexec}/bash-init.sh
    EOS
  end

  # Homebrew requires tests.
  test do
    assert_match "0.8", shell_output("#{bin}/pruney --version", 2)
  end
end