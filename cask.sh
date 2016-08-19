#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

################################################################[ SW inst ]#####
echo "Installing essential software..."
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  successfully brew cask install doxygen
  successfully brew cask install dropbox
  successfully brew cask install google-drive
  successfully brew cask install the-unarchiver
  successfully brew cask install google-chrome
  successfully brew cask install vlc
  successfully brew cask install skype
  successfully brew cask install slack
  successfully brew cask install istat-menus
  successfully brew cask install github-desktop
  successfully brew cask install sublime-text
  successfully brew cask install screenflow
  successfully brew cask install flash
  successfully brew cask install vagrant
  successfully brew cask install virtualbox
  successfully brew cask install alfred
