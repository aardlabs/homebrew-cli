require "formula"
require_relative "lib/private_strategy"

class Aard < Formula
  desc "aard is Aardvark's CLI"
  homepage "https://aardvarklabs.com/"
  url "https://github.com/aardlabs/homebrew-cli/releases/download/v0.9.2/aard-darwin-amd64-v0.9.2.zip"
  sha256 "dd2c096a5e654d5f9edfa667124b5b8cb43416172c7e6fb2d3dfebaf27c81f01"
  head "https://github.com/aardlabs/homebrew-cli.git"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"aard"
  end

  def caveats
    <<~EOS
      aard (the aardvark CLI) can track your command history locally.
      To enable this for the bash shell, either run the following command or
      add it your last line of your bash_profile or bashrc --:

      source #{opt_libexec}/bash-init.sh
    EOS
  end

  # Homebrew requires tests.
  test do
    assert_match "0.9.2", shell_output("#{bin}/aard --version", 2)
  end
end