class BrewFile < Formula
  desc "Brewfile manager for Homebrew."
  homepage "https://github.com/kazumanagano/homebrew-file/"
  url "https://github.com/kazumanagano/homebrew-file/archive/v7.0.3.tar.gz"
  sha256 "ef6370500aea8994e03d0b5d0880ee39d5052f8119bdfb19dfdb93bc5d5247f5"

  head "https://github.com/kazumanagano/homebrew-file.git"

  option "without-completions", "Disable bash/zsh completions"

  def install
    bin.install "bin/brew-file"
    rm_f etc/"brew-wrap.default"
    rm_f etc/"brew-wrap"
    (prefix/"etc").install "etc/brew-wrap"
    if build.with? "completions"
      bash_completion.install "etc/bash_completion.d/brew-file"
      zsh_completion.install "share/zsh/site-functions/_brew-file"
    end
  end

  test do
    system "brew", "file", "help"
  end
end
