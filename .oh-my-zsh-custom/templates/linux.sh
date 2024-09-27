#!/usr/bin/env bash

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export ENV_PATH=~/dev
export DOTFILES_PATH="$ENV_PATH/.oh-my-zsh-custom/templates"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# zsh
source <(fzf --zsh)

# If you come from bash you might have to change your $PATH.
export CUSTOM_SCRIPTS_PATH=~/dev
export DOTNET_ROOT=$HOME/.dotnet

export PATH=~/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$CUSTOM_SCRIPTS_PATH/scripts:$PATH
export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THEME AND PLUGINS
source "$DOTFILES_PATH/theme.sh"

# Which plugins would you like to load?
plugins=(
    bundler 
    git 
    brew 
    zsh-autosuggestions 
    web-search 
    jsontools 
    z 
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# keybinds
bindkey "^U" backward-kill-line

# Custom Aliases
source "$DOTFILES_PATH/aliases.sh"

# environment variables
export EDITOR="code -w"