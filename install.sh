#!/bin/sh

if [ ! -d "$HOME/Repos/" ]; then
  mkdir "$HOME/Repos"
fi
DIR="$HOME/Repos"
cd $DIR
git clone --recursive https://github.com/corefile/autostall.git
cd autostall
