#!/bin/bash

#install homebrew if it does not exist on the computer 
if command -v brew 1>/dev/null 2>&1; then
    echo "*** Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ $(uname -o) == "GNU/Linux" ]]; then
        sudo apt-get install build-essential
    fi
fi

echo "*** Installing tools"
brew install glow
brew install fd 
brew install fzf
brew install bat

# install certain formulae only if we are on a mac
if [[ $(uname) == "Darwin" ]]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
    brew install iterm2
    brew install wget
    brew install coreutils
    brew install python
    brew install zsh
    brew install pyenv
    brew install pyenv-virtualenv
    brew install jenv
    brew install duti
fi