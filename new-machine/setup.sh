#!/bin/bash

cd ~

Echo "*** Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd dev/new-machine

./link_dotfiles.sh

Echo "*** Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

./install_homebrew.sh
./configure_git.sh


