ZSH_CUSTOM_FED="$HOME/.oh-my-zsh-custom/plugins/fed"
STYLE="$HOME/.oh-my-zsh-custom/plugins/fed/catppuccin.json"

function fed() {
  case "$1" in
    grid)
      glow $ZSH_CUSTOM_FED/grid.md -w 150 -s $STYLE
      ;;
    flex-container)
      glow $ZSH_CUSTOM_FED/flexbox-container.md -w 150 -s $STYLE
      ;; 
    flex-child)
      glow $ZSH_CUSTOM_FED/flexbox-child.md -w 150 -s $STYLE
      ;;   
    *)
      echo "Unknown command"
      ;;
  esac
}
