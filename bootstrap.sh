#!/bin/bash

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
  bash brew.sh
