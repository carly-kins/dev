#!/bin/bash

CODESPACES="/workspaces/.codespaces/.persistedshare/dotfiles"
script_dir="$(dirname "$(readlink -f "$0")")"
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

create_symlinks() {

    # Need to make sure that the file does not exist in ~
    rm -rf $HOME/.oh-my-zsh-custom
    ln -s $script_dir/.oh-my-zsh-custom $HOME
    # Need to make sure that the file does not exist in ~
    rm -rf $HOME/.zshrc
    ln -s $script_dir/.oh-my-zsh-custom/templates/zshrc.zsh-template $HOME/.zshrc
    # Install spaceship theme and plugins

    echo "Setting up the Spaceship theme."
    
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" --depth=1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" --depth=1
    git clone https://github.com/catppuccin/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/catppuccin/" --depth=1
    ln -v "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" "$HOME/.zsh"

}


if [ $script_dir = $CODESPACES ];
then
    echo "In Codespaces"
    create_symlinks
else 
    echo "Not in Codespaces"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    create_symlinks
    ln -s $script_dir/new-machine/dotfiles/.bash_profile $HOME
    ln -s $script_dir/new-machine/dotfiles/.git-prompt $HOME
    $script_dir/new-machine/install_homebrew.sh
    $script_dir/new-machine/configure_git.sh
    echo "Close your terminal and reopen :) - Don't forget to update your iterm files!"
fi
