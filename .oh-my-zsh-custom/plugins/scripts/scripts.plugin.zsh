#!/bin/bash

SCRIPTS="$HOME/dev/.oh-my-zsh-custom/plugins/scripts"

# TODO: combine functionality with Fed's setup here: https://github.com/fmenozzi/env/blob/master/tools/open
function hint() {
  INPUT="$1"
  "$SCRIPTS"/hint.sh $INPUT
}

function fed() {
  INPUT="$1"
  "$SCRIPTS"/fed.sh $INPUT
}

function line-height() {
  "$SCRIPTS"/line-height.sh
}

function emoji() {
  INPUT="$1"
  "$SCRIPTS"/emoji.sh $INPUT
}