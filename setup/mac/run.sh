#!/usr/bin/env bash

# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$(pwd)/$(dirname "$0")"

if [[ ! -d "$(pwd)/config" ]]; then
  echo "Not in repository root, exiting"
  exit 1
fi

# echo $DIR

source "$DIR/brew.sh"
source "$DIR/stow.sh"
