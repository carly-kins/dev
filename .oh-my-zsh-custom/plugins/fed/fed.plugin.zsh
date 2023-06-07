#!/bin/bash

STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"
DEVHINTS="https://raw.githubusercontent.com/rstacruz/cheatsheets/master"
REPO="$HOME/Repositories"

# TODO: combine functionality with Fed's setup here: https://github.com/fmenozzi/env/blob/master/tools/open
# TODO: Change out for getopts https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash
function hint() {
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

}

function fed() {
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

}
