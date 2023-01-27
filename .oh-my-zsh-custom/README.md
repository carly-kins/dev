oh-my-zsh-custom
================

A few zsh/oh-my-zsh customizations. Much thanks to [Duprasville](https://github.com/duprasville/oh-my-zsh-custom).

Getting Started
---------------

1. Install Zsh and Coreutils (via [Homebrew](http://brew.sh/))

        $ brew install zsh
        $ brew install coreutils

1. Clone the [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) repository into your home directory

        $ git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh ~/.oh-my-zsh

1. Clone this repository

        $ git clone git@github.com:carly-kins/dev.git

1. symlink `.oh-my-zsh-custom` and `zshrc.zsh-template` into your home directory

		$ ln -s $(pwd)/dev/.oh-my-zsh-custom ~/.oh-my-zsh-custom
		$ ln -s $(pwd)/dev/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc

1. Change shell to zsh

        $ chsh -s /bin/zsh
