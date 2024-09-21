#!/bin/bash

CODESPACES="/workspaces/.codespaces/.persistedshare/dotfiles"
script_dir="$(dirname "$(readlink -f "$0")")"
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

create_symlinks() {

    # Need to make sure that the file does not exist in ~
    echo $script_dir
    rm -rf $HOME/.oh-my-zsh-custom
    ln -s $script_dir/.oh-my-zsh-custom $HOME
    # Need to make sure that the file does not exist in ~
    rm -rf $HOME/.zshrc
    ln -s $script_dir/.oh-my-zsh-custom/templates/zshrc.zsh-template $HOME/.zshrc
    # Install spaceship theme and plugins

    echo "Setting up the Spaceship theme."

    # Need to make sure that the file does not exist to reinstall 
    rm -rf $ZSH_CUSTOM/themes/spaceship-prompt
    rm -rf $ZSH_CUSTOM/themes/spaceship.zsh-theme
    rm -rf $ZSH_CUSTOM/plugins/zsh-autosuggestions
    rm -rf $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" --depth=1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" --depth=1
}

#TODO: Replace with case statement https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_03.html
if [ $script_dir = $CODESPACES ];
then
    echo "In Codespaces"
    create_symlinks
else 
    echo "Not in Codespaces"
    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    create_symlinks
    # ln -s $script_dir/new-machine/dotfiles/.bash_profile $HOME
    cd $script_dir/new-machine/
    ./install_homebrew.sh
    echo "Close your terminal and reopen :) - Don't forget to update your iterm files!"
fi
