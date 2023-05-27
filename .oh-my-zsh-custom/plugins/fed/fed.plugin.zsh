
STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"
DEVHINTS="https://raw.githubusercontent.com/rstacruz/cheatsheets/master"
REPO="$HOME/Repositories"

# TODO: combine functionality with Fed's setup here: https://github.com/fmenozzi/env/blob/master/tools/open

function hint() {
  INPUT="$1"
  PERSONAL=$(find "$DEV" -name "$INPUT.md") #personal notes
  DEVHINTS_URL="${DEVHINTS}/${INPUT}.md"  #devhints
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
        echo "
        ERROR: Info not found in Libraries. 
        
        To see the full output of information:
        hint -l           display full library of searchable terms
        hint patternlab   Patternlab documentation 
        hint superscript  Superscript generator

        Other commands to search
        tldr              info on man pages
        cht.sh            search lots of different cheatsheets on the internet 
        google            google search form the command line
        "
        #exit 1 # Command to come out of the program with status 1 || "$?" -eq 0
      fi
    fi
    ;;
  esac

}

function fed() {
  INPUT="$1"
  case ${INPUT} in
  code)
    code "$(fd -t f | fzf --preview="cat {}")"
    ;;
  find)
    fd -t f | fzf --preview="cat {}"
    ;;
  svg)
    open https://jakearchibald.github.io/svgomg/
    ;;
  shortcuts)
    code "${DEV}"/shortcuts.md
    ;;
  notes)
    code "${DEV}"/notes.md
    ;;
  repo)
    cd || exit
    cd "$REPO" || exit
    ;;
  *)
    echo "
    ERROR: Tool not found
        
    To see the full output of information:
    svg               svgomg
    shortcuts         edit shortcuts file
    notes             edit notes file
    "
    ;;
  esac

}
