A personal repository for maintaining development-related things (scripts, profiles, etc.). Thanks to [Kevin](https://github.com/kevinchabreck), [Adam](https://github.com/aenewton), and [Fed](https://github.com/fmenozzi) for the help! 

# New Machine Setup

An automated setup to install oh-my-zsh, nvm, homebrew, and custom .bash_profiles. It also configures git!

## Getting Started

1. Clone this repositry. 
2. Run 
        $ sh install.sh

3. Close your terminal are reopen!
4. Import `carlyIterm2.json` into iterm. This will be under `iterm2 > settings > profiles`

## Helpful Reminders
To change shell to zsh

        $ chsh -s /bin/zsh

To change shell to bash

        $ chsh -s /bin/bash


# Github Codespaces
Codespaces will automatically pull the zsh dotfiles from the root of this repository and configure them using the `install.sh` script. I used this [guide](https://bea.stollnitz.com/blog/codespaces-terminal/) as inspriation for my setup. 

# Other notes 
Slack theme: (Based off Catpuccin - #21262D,#F8F8FA,#A6E3A1,#1E1E2E,#11111B,#CDD6F4,#A6E3A1,#DB889F,#0D1117,#CDD6F4)

TODO: 
- Configure for whether on MacOS or Linux with homebrew
- clean up dotfiles - check for which machine we are on 

