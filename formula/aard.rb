# Autogenerated (Do not edit)

require "formula"
require_relative "lib/private_strategy"

class Aard < Formula
  desc "aard is Aardvark's CLI"
  homepage "https://aardvarklabs.com/"
  url "https://github.com/aardlabs/cli-release/releases/download/0.9.19/aard-darwin-amd64-0.9.19.zip"
  sha256 ""
  head "https://github.com/aardlabs/homebrew-cli.git"
  # depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"aard"
    (bash_completion/"aard").write `#{bin}/aard completion -s bash`
    (fish_completion/"aard.fish").write `#{bin}/aard completion -s fish`
    (zsh_completion/"_aard").write `#{bin}/aard completion -s zsh`
  end

  def caveats
    <<~EOS
      aard is the aardvark CLI.

      * Once installed, you can run the following command to help get started

        $ aard --help

    EOS
  end

  # Homebrew requires tests.
  test do
    assert_match "0.9.19", shell_output("#{bin}/aard --version", 2)
  end
end