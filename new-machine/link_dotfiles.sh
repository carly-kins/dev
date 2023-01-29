#!/bin/bash

NEW="dev/new-machine/dotfiles"
DEV="dev/.oh-my-zsh-custom"

ln -s $NEW/.bash_profile ~
ln -s $NEW/.git-prompt ~

rm .zshrc

ln -s $DEV ~
ln -s $DEV/templates/zshrc.zsh-template ~/.zshrc
#ln -s $DEV/.dircolors ~/.dircolors
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"