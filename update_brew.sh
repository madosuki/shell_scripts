#!/bin/sh

cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core

git pull

# git push madosuki dev
# git push madosuki master
brew upgrade
brew cleanup
