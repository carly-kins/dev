ZSH_CUSTOM_FED="$HOME/.oh-my-zsh-custom/plugins/fed"
STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"
DEV="$HOME/dev/.dev-knowledge"

function hint() {
  INPUT="$1"
  DICT=$(find $DEV -name "$INPUT.md")
  glow $DICT -w 150 -s $STYLE
}

#function library() {
#  find $DEV -type d \( -path "$DEV/cheatsheets/_inactive" -o -path "$DEV/cheatsheets/fitness" -o -path "$DEV/cheatsheets/depreciated" \) -prune -o -print | grep -i '.*[.]md' | xargs -L 1 basename | sort
#}

function library(){
  INPUT="$1"
  grep --include=\*.md -lrw --exclude-dir={"$DEV/cheatsheets/_inactive","$DEV/cheatsheets/fitness","$DEV/cheatsheets/depreciated"} $DEV -e $INPUT | xargs -L 1 basename | awk -F".md" '$1=$1' OFS=" " | sort 
}
