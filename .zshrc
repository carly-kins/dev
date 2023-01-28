export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0

# Plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set colors for LS_COLORS.
eval `dircolors ~/.dircolors`

# custom aliases
# alias ls="ls -lahG"
alias ls="gls -lah --color --group-directories"
alias s="code"
alias c="code"
alias p="python3"
alias o="open"
alias dkr="docker"
alias dm="docker-machine"
alias compose="docker-compose"
alias ij="idea"
alias xml="xmllint --format"
alias tf="terraform"
alias cdiff="colordiff"
alias vdiff="vimdiff"
alias path="realpath"
alias cpkey="ssh-copy-id -i ~/.ssh/id_rsa"
alias pages="open -a pages"

# environment variables
export EDITOR="code"
