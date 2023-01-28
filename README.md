A personal repository for maintaining development-related things (scripts, profiles, etc.)

# New Machine Setup

## bash

A set of scripts and configurations that should work on most linux/unix environments

## Getting Started

1. Add [`.bash_profile`](.bash_profile) to the home directory
	- **local:**  `ln -s $(pwd)/.profile ~/.profile`
	- **remote:** `wget -O ~/.bash_profile https://raw.githubusercontent.com/carly-kins/dev/master/.bash_profile`

1. Add [`.git-prompt.sh`](.git-prompt.sh) to the home directory
	- **local:**  `cp .git-prompt.sh ~/.git-prompt.sh`
	- **remote:** `wget -O ~/.git-prompt.sh https://raw.githubusercontent.com/carly-kins/dev/master/.git-prompt.sh`


## oh-my-zsh-custom


A few zsh/oh-my-zsh customizations. Much thanks to [Duprasville](https://github.com/duprasville/oh-my-zsh-custom).


1. Install Zsh and Coreutils (via [Homebrew](http://brew.sh/))

        $ brew install zsh
        $ brew install coreutils

1. Clone the [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) repository into your home directory

        $ git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

1. Clone this repository

        $ git clone git@github.com:carly-kins/dev.git

1. symlink `.oh-my-zsh-custom` and `zshrc.zsh-template` into your home directory

		$ ln -s $(pwd)/dev/.oh-my-zsh-custom ~/.oh-my-zsh-custom
		$ ln -s $(pwd)/dev/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc

1. Change shell to zsh

        $ chsh -s /bin/zsh

# Github Codespaces
https://bea.stollnitz.com/blog/codespaces-terminal/

