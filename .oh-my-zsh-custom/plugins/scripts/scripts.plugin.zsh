#!/bin/bash

SCRIPTS="$HOME/dev/.oh-my-zsh-custom/plugins/scripts"

# TODO: combine functionality with Fed's setup here: https://github.com/fmenozzi/env/blob/master/tools/open
function hint() {
  INPUT="$1"
  "$SCRIPTS"/hint $INPUT
}

function fed() {
  INPUT="$1"
  "$SCRIPTS"/fed $INPUT
}

function line-height() {
  "$SCRIPTS"/line-height
}

function emoji() {
  INPUT="$1"
  "$SCRIPTS"/emoji $INPUT
}

function self-eval() {
  "$SCRIPTS"/self-eval $1 $2 $3 $4 $5 
}