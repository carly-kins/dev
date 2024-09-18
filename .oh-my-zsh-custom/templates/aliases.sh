#!/usr/bin/env bash

alias ls="ls -lah --color"
alias c="code"
alias p="python3"
alias o="open"
alias r="cd ~/Repositories"
alias dkr="docker"
alias dm="docker-machine"
alias compose="docker-compose"
alias xml="xmllint --format"
alias cdiff="colordiff"
alias path="realpath"
alias cpkey="ssh-copy-id -i ~/.ssh/id_rsa"
alias pages="open -a pages"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitdeletelocal='git branch --merged | grep -v \* | xargs git branch -D'
alias tc="timeCalc"
alias cye2e="npm run e2e:chrome -- --spec"