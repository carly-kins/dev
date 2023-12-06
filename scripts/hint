#!/bin/bash

STYLE="$HOME/.oh-my-zsh-custom/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"
DEVHINTS="https://raw.githubusercontent.com/rstacruz/cheatsheets/master"

# TODO: Change out for getopts https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash

usage() { printf "
    ERROR: Info not found in Libraries. 
    
    To see the full output of information:
    hint -l           display full library of searchable terms

    Other commands to search
    tldr              info on man pages
    cht.sh            search lots of different cheatsheets on the internet 
    google            google search form the command line
    "; }

INPUT="$1"
PERSONAL=$(find "$DEV" -name "$INPUT.md") #personal notes
DEVHINTS_URL="${DEVHINTS}/${INPUT}.md"    #devhints
case ${INPUT} in
-l)
    glow "${DEV}"/table-of-contents.md -w 150 -s "$STYLE"
    ;;
*)
    if [[ -f "$PERSONAL" ]]; then
        glow "$PERSONAL" -w 150 -s "$STYLE"
    else
        if curl --output /dev/null --silent --head --fail "$DEVHINTS_URL"; then
            glow "$DEVHINTS_URL" -w 150 -s "$STYLE"
        else
            usage
            #exit 1 # Command to come out of the program with status 1 || "$?" -eq 0
        fi
    fi
    ;;
esac
