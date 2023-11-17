#!/bin/bash

REPO="$HOME/Repositories"
DEV="$HOME/dev/.dev-knowledge"

# TODO: Change out for getopts https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash

usage() { printf "
    ERROR: Tool not found

    To see the full output of information:
    o     list all items in current directory and open in VSCode
    b     list all items in current directory and output to bat
    r     open repo folder
    svg   svgomg
    sc    edit shortcuts file
    n     edit notes file
    "; }

INPUT="$1"
BAT="bat --color=always --line-range=:500 {}"
case ${INPUT} in
o)
    open "$(fd -t f | fzf --preview="${BAT}")" #Note: if this doesn't work for a file run "duti -s com.microsoft.VSCode [file type] all"
    ;;
b)
    bat --style="plain" "$(fd -t f | fzf --preview="${BAT}")"
    ;;
svg)
    open https://jakearchibald.github.io/svgomg/
    ;;
sc)
    code "${DEV}"/shortcuts.md
    ;;
n)
    code "${DEV}"/notes.md
    ;;
r)
    cd || exit
    cd "$REPO" || exit
    ;;
*)
    usage
    ;;
esac
