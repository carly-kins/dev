#!/bin/bash

usage() { printf " ERROR: Could not divide numbers"; }

font=0
line=0

echo "Enter the font-size -------------"
read font
echo "Enter the defined line-height ---"
read line
echo "---------------------------------"

if [ $((line / font)) ]; then
    echo "$(bc <<<"scale=2; $line/$font")"
else
    usage
fi
