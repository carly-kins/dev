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

if $script_dir=$CODESPACES 
then
    create_symlinks
    ln -s $(pwd)/.oh-my-zsh-custom ~
else 
    echo "Not in Codespaces"
fi


