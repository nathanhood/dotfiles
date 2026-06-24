#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
brew install git

# Shell tooling
brew install direnv
brew install nvm

# Python tooling
brew install pyenv
brew install pyenv-virtualenvwrapper
brew install asdf

# Database
brew install mysql-client

# Java (for liquibase)
brew install openjdk@21

# Google Cloud SDK
brew install google-cloud-sdk

# Install latest Python 3.11.x via pyenv
pyenv install 3.11

# Remove outdated versions from the cellar.
brew cleanup
