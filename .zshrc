# For Codespaces
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

DISABLE_MAGIC_FUNCTIONS="true"

DISABLE_AUTO_TITLE="true"

ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

plugins=(
    bundler 
    git 
    docker 
    docker-compose 
    python gradle 
    brew table 
    zsh-autosuggestions 
    web-search 
    jsontools 
    z 
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

bindkey "^U" backward-kill-line

alias ls="ls -lah --color --group-directories"
alias c="code"
alias p="python3"
alias o="open"
alias dkr="docker"
alias dm="docker-machine"
alias compose="docker-compose"
alias xml="xmllint --format"
alias cdiff="colordiff"
alias vdiff="vimdiff"
alias path="realpath"
alias cpkey="ssh-copy-id -i ~/.ssh/id_rsa"
alias pages="open -a pages"
alias gitroot='cd $(git rev-parse --show-toplevel)'

eval `dircolors ~/.dircolors` 
