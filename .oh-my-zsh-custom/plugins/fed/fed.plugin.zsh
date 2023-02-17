ZSH_CUSTOM_FED="$HOME/.oh-my-zsh-custom/plugins/fed"
STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"
DEVHINTS="https://raw.githubusercontent.com/rstacruz/cheatsheets/master"

#function hint() {
#INPUT="$1"
#DICT=$(find $DEV -name "$INPUT.md")
# glow $DICT -w 150 -s $STYLE
#}

#function library() {
#  find $DEV -type d \( -path "$DEV/cheatsheets/_inactive" -o -path "$DEV/cheatsheets/fitness" -o -path "$DEV/cheatsheets/depreciated" \) -prune -o -print | grep -i '.*[.]md' | xargs -L 1 basename | sort
#}

#function library() {
# INPUT="$1"
#grep --include=\*.md -lrw --exclude-dir={"$DEV/cheatsheets/_inactive","$DEV/cheatsheets/fitness","$DEV/cheatsheets/depreciated"} $DEV -e $INPUT | xargs -L 1 basename | awk -F".md" '$1=$1' OFS=" " | sort
#}

function Devhints() {
  INPUT="$1"
  https://raw.githubusercontent.com/rstacruz/cheatsheets/master/$1.md
}

function hint() {
  option="${1}"
  case ${option} in
  -c)
    INPUT="${2}"
    DICT=$(find $DEV -name "$INPUT.md")
    glow $DICT -w 150 -s $STYLE
    ;;
  -d)
    INPUT="${2}"
    glow $DEVHINTS/${INPUT}.md -w 150 -s $STYLE
    ;;
  *)
    echo "$(basename ${0}):usage: [-c carly notes] | [-d DevHints] | [-l library]"
    exit 1 # Command to come out of the program with status 1 || "$?" -eq 0
    ;;
  esac
}

function blah() {
  INPUT="$1"
  DICT=$(find $DEV -name "$INPUT.md")
  URL="${DEVHINTS}/${INPUT}.md"
  if curl --output /dev/null --silent --head --fail "$URL"; then
    echo "yay"
  else
    echo "nay"
  fi
}

function checkDevKnowledge() {
  INPUT="$1"
  CARLY=$(find $DEV -name "$INPUT.md")

  if [[ -f $CARLY ]]; then
    return true
  else
    return false
  fi
}

function test() {
  checkDevKnowledge
  if true; then
    echo "true"
  else
    echo "false"
  fi
}
