#!/bin/bash

SCRIPTS="$HOME/dev/.oh-my-zsh-custom/plugins/scripts"

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
