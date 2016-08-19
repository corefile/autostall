#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

fi

export PATH="/usr/local/bin:$PATH"

echo "Upda-grading Homebrew..."
  successfully brew update
  successfully brew upgrade
  
################################################################[ SW inst ]#####
echo "Hipsterizing your terminal with homebrewed zsh"
  successfully brew install zsh
  successfully brew install zsh-completions
  successfully brew install zsh-syntax-highlighting
 
  successfully brew install openssl
  successfully brew install python
  successfully brew install httpie
  successfully brew install wget
  successfully brew install mtr
  successfully brew install git
  successfully brew install vim
  successfully brew install tmux
  successfully brew install imagemagick
  successfully brew install youtube-dl
  successfully brew install watch
  successfully brew install doxygen
