#!/bin/bash
Echo "*** Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Echo "*** Installing tools"
brew install zsh
brew install wget
brew install coreutils
brew install iterm2
brew install pyenv
brew install python
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install glow