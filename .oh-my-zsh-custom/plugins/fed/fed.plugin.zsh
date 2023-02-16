ZSH_CUSTOM_FED="$HOME/.oh-my-zsh-custom/plugins/fed"
STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"

function fed() {
  case "$1" in
    grid)
      glow $ZSH_CUSTOM_FED/grid.md -w 150 -s $STYLE
      ;;
    flex)
      glow $ZSH_CUSTOM_FED/flex.md -w 150 -s $STYLE
      ;;
    git)
      glow $ZSH_CUSTOM_FED/git.md -w 150 -s $STYLE
      ;;     
    *)
      echo "Unknown command"
      ;;
  esac
}
