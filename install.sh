#!/bin/bash

CODESPACES="/workspaces/.codespaces/.persistedshare/dotfiles"
script_dir=$(dirname "$(readlink -f "$0")")
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

create_symlinks() {

    #Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

if [ $script_dir=$CODESPACES ]
then
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

else 
    echo "Not in Codespaces"
fi


