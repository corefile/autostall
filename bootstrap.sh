#!/bin/bash

# Make this script execution path-independent
export BOOTSTRAP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

# Check that Xcode command line tools are already there
clang_path=`which clang`
if [[ ! -f $clang_path ]]
then
	echo -ne "\x1B[00;31mYou need XCode command line tools to proceed\n\x1B[00m"
	exit -1
fi

################################################################[ Basic SW ]####
echo "Installing SW to make my Macbook useful... (thanks to Homebrew)"
  bash $BOOTSTRAP_DIR/brew.sh
  bash $BOOTSTRAP_DIR/cask.sh
  
################################################################[ OSX ]#########
echo "Customizin OSX... (inspired by https://github.com/mathiasbynens/dotfiles)"
  successfully bash $BOOTSTRAP_DIR/osx-tweaks.sh
echo "Setting RootFS to mount with 'noatime'..."
  successfully sh $BOOTSTRAP_DIR/MountNoAtime.sh
  
################################################################[ Dock Links ]##
# echo "Run Dropbox to configure its folder..."
#  successfully open /Applications/Dropbox.app
#
# echo "Adding some shortcuts to my Dock..."
#  successfully bash $BOOTSTRAP_DIR/Folder2Dock.sh $HOME/ Home
#  successfully bash $BOOTSTRAP_DIR/Folder2Dock.sh $HOME/Dropbox/ Dropbox
#  killall Dock

################################################################[ The End ]#####
echo "DONE!"
echo "Remember that some stuff may only be operative after reboot (or simple user log out)"

