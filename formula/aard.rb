require "formula"
require_relative "lib/private_strategy"

class Aard < Formula
  desc "aard is Aardvark's CLI"
  homepage "https://aardvarklabs.com/"
  url "https://github.com/aardlabs/homebrew-cli/releases/download/v0.9.1/pruney-darwin-amd64-v0.9.1.zip"
  head "https://github.com/aardlabs/homebrew-cli.git"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"pruney"
  end

  def caveats
    <<~EOS
      To allow aard to capture command history for the bash shell.
      Add the following to the last line of your bash_profile or bashrc --:
        source #{opt_libexec}/bash-init.sh
    EOS
  end

  # Homebrew requires tests.
  test do
    assert_match "0.91", shell_output("#{bin}/pruney --version", 2)
  end
end