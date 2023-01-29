A personal repository for maintaining development-related things (scripts, profiles, etc.). Thanks to [Kevin](https://github.com/kevinchabreck) and [Adam](https://github.com/aenewton) for the help! 

# New Machine Setup

An automated setup to install oh-my-zsh, nvm, homebrew, and custom .bash_profiles. It also configures git!

## Getting Started

1. Clone this repositry to your home directory. 
2. Run 
        $ dev/new-machine/setup.sh

3. Close your terminal are reopen!
4. Import `carly-iterm2.json` into iterm. This will be under `iterm2 > settings > profiles`

## Helpful Reminders
To change shell to zsh

        $ chsh -s /bin/zsh

To change shell to bash

        $ chsh -s /bin/bash

To update plugins and custom fonts

        $ git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
        $ ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
        $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting


# Github Codespaces
Codespaces will automatically pull the dotfiles from the root of this repository and configure them using the `install.sh` script. I used this [guide](https://bea.stollnitz.com/blog/codespaces-terminal/) as inspriation for my setup. 

