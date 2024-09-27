#!/usr/bin/env bash

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export ENV_PATH=~/dev
export DOTFILES_PATH="$ENV_PATH/.oh-my-zsh-custom/templates"
$(brew --prefix)/bin/brew shellenv

# If you come from bash you might have to change your $PATH.
export PYENV_PATH=~/.pyenv 
export JENV_PATH=~/.jenv
export CUSTOM_SCRIPTS_PATH=~/dev
export DOTNET_ROOT=$HOME/.dotnet

export PATH=~/bin:/usr/local/bin:$PATH
export PATH=$CUSTOM_SCRIPTS_PATH/scripts:$PATH
export PATH=$JENV_PATH/bin:$PATH
export PATH=$PYENV_PATH/shims:$PATH
export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH" 

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Dear Carly, at some Point you are going to look for java paths. 
# You have to add it to jenv first 
# do so with `jenv add $(/usr/libexec/java_home -vVERSION)
# then set it globally with `jenv global -VERSION`

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
    aem
    )

source $ZSH/oh-my-zsh.sh

if command -v brew 1>/dev/null 2>&1; then
  source $(brew --prefix)/Cellar/fzf/0.41.1/shell/key-bindings.zsh
  source $(brew --prefix)/Cellar/fzf/0.41.1/shell/completion.zsh
# Ruby on Mac https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#start-here-if-you-choose-the-long-and-manual-route
  source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
  source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.1.3
fi

# User configuration
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# keybinds
bindkey "^U" backward-kill-line

# Custom Aliases
source "$DOTFILES_PATH/aliases.sh"

# Set colors for LS_COLORS.
# eval `gdircolors ~/.dircolors` 

# environment variables
export EDITOR="code -w"

#jenv https://www.jenv.be/ -- Check if jenv exists
if command jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# Apple Silicon and Node Sass
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
#virtualenv -- Check if virtualenv exists
  eval "$(pyenv virtualenv-init -)"
fi