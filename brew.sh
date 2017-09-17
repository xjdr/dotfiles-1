#!/usr/bin/env bash

# Install command-line tools using Homebrew.
if hash git 2>/dev/null; then
    git --version
else
    git
fi

# Install Homebrew
function get_brew {
    if hash brew 2>/dev/null; then
	brew doctor
    else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

get_brew

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2


# Install other useful binaries.
brew install the_silver_searcher
brew install tmux
brew install git
brew install git-lfs
brew install tree

# Install and set up GO
brew install go

# Install and set up Python3
brew install python3

# Install Java
brew cask install java
brew install maven
brew install infer

# Remove outdated versions from the cellar.
brew cleanup

# Brew cask
brew cask install slack
brew cask install chrome
brew cask install emacs

brew cask install atom
brew cask install visual-studio-code
brew cask install iterm2
brew cask install alfred
