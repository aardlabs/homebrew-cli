# Autogenerated (Do not edit)

require "formula"
require_relative "lib/private_strategy"

class Aard < Formula
  desc "aard is Aardvark's CLI"
  homepage "https://aardvarklabs.com/"
  url "https://github.com/aardlabs/homebrew-cli/releases/download/v0.9.5/aard-darwin-amd64-v0.9.5.zip"
  sha256 "ec2c215c34589aac63ab7fd6d0a5131c68562e1653165865b6b0e5d4cd7cc9bf"
  head "https://github.com/aardlabs/homebrew-cli.git"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"aard"
    (bash_completion/"aard").write `#{bin}/aard completion -s bash`
    (fish_completion/"aard.fish").write `#{bin}/gh completion -s fish`
    (zsh_completion/"_aard").write `#{bin}/aard completion -s zsh`
  end

  def caveats
    <<~EOS
      aard is the aardvark CLI.

      * Once installed, you can run the following command to help get started

        $ aard --help

      * Command history: aard can track your command history locally.

      To enable this for the bash shell, please add this to your last
      line of your .bash_profile or .bashrc.

        source #{opt_libexec}/bash-init.sh

      To enable this for the zsh shell, please add this to .zshrc.

        source #{opt_libexec}/zsh-init.sh

    EOS
  end

  # Homebrew requires tests.
  test do
    assert_match "0.9.5", shell_output("#{bin}/aard --version", 2)
  end
end