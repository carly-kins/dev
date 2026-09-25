#!/usr/bin/env bash
export ENV_PATH=~/dev
export DOTFILES_PATH="$ENV_PATH/.oh-my-zsh-custom/templates"

# Set name of the theme to load --- with theme customizations
ZSH_THEME="spaceship"
# SPACESHIP_GIT_BRANCH_PREFIX="🌱 "
export SPACESHIP_DIR_TRUNC=0

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( )

DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
SPACESHIP_PROMPT_ASYNC=false

ZSH_CUSTOM=~/.oh-my-zsh-custom

# Custom colors
source "$DOTFILES_PATH/colors.sh"
