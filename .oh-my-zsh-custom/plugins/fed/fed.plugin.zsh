STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"
DEVHINTS="https://raw.githubusercontent.com/rstacruz/cheatsheets/master"

function hint() {
  INPUT="$1"
  PERSONAL=$(find $DEV -name "$INPUT.md") #personal notes
  DEVHINTS_URL="${DEVHINTS}/${INPUT}.md"  #devhints
  case ${INPUT} in
  -l)
    glow ${DEV}/table-of-contents.md -w 150 -s $STYLE
    ;;
  -d)
    glow $DEVHINTS_URL -w 150 -s $STYLE
    ;;
  -p)
    glow $PERSONAL -w 150 -s $STYLE
    ;;
  *)
    if [[ -f $PERSONAL ]]; then
      glow $PERSONAL -w 150 -s $STYLE
    else
      if curl --output /dev/null --silent --head --fail "$DEVHINTS_URL"; then
        glow $DEVHINTS_URL -w 150 -s $STYLE
      else
        echo "
        ERROR: Info not found in Libraries. 
        
        To see the full output of information:
        hint -l           display full library of searchable terms
        hint -p           only search personal notes
        hint -d           only search devhints.io

        Other commands to search (will be added soon)
        tldr              info on man pages
        cht.sh            search lots of different cheatsheets on the internet 
        "
        #exit 1 # Command to come out of the program with status 1 || "$?" -eq 0
      fi
    fi
    ;;
  esac
}
