#!/bin/bash

CODESPACES="/workspaces/.codespaces/.persistedshare/dotfiles"
script_dir=$(dirname "$(readlink -f "$0")")

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
    rm -rf ~/.oh-my-zsh-custom
    ln -s $script_dir/.oh-my-zsh-custom ~
    # Need to make sure that the file does not exist in ~
    rm -rf ~/.zshrc
    ln -s $script_dir/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc
    # Install spaceship theme
    cd ~
    echo "Installing fonts."
    FONT_DIR="$HOME/.fonts"
    git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
    cd $FONT_DIR
    ./install.sh

    echo "Setting up the Spaceship theme."
    ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

else 
    echo "Not in Codespaces"
fi


