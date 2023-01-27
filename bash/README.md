# bash

A set of scripts and configurations that should work on most linux/unix environments

## Getting Started

1. Add [`.profile`](.profile) to the home directory
	- **local:**  `ln -s $(pwd)/.profile ~/.profile`
	- **remote:** `wget -O ~/.profile https://raw.githubusercontent.com/carly-kins/dev/master/bash/.profile`

1. Add [`.git-prompt.sh`](.git-prompt.sh) to the home directory
	- **local:**  `cp .git-prompt.sh ~/.git-prompt.sh`
	- **remote:** `wget -O ~/.git-prompt.sh https://raw.githubusercontent.com/carly-kins/dev/master/bash/.git-prompt.sh`
