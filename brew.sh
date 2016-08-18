#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

################################################################[ BREW ]########
brew_path=`which brew`
if [[ ! -f $brew_path ]]
then 
  echo "Installing Homebrew, a good OS X package manager..."
      successfully ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
fi

echo "Upda-grading Homebrew..."
  successfully brew update
  successfully brew upgrade
