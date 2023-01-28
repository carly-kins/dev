export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="gozilla"
#export SPACESHIP_DIR_TRUNC=0

# Plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set colors for LS_COLORS.
eval `dircolors ~/.dircolors`

# environment variables
export EDITOR="code"

source /workspaces/.codespaces/.persistedshare/dotfiles/.bash_profile