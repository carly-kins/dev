#!/bin/bash

cd ~

Echo "*** Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Echo "*** Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

cd dev/new-machine

./install_homebrew.sh
./configure_git.sh
./link_dotfiles.sh

