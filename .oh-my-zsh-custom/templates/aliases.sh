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
alias trans="./trans"

# Layer in company-only Claude Code plugins/marketplaces (gitignored, machine-local
# ~/dev/claude/settings.company.json) on top of the tracked ~/.claude/settings.json.
# No-op if that file isn't present on this machine.
if [ -f "$HOME/dev/claude/settings.company.json" ]; then
  alias claude="claude --settings $HOME/dev/claude/settings.company.json"
fi
