#!/bin/bash
############################
# init.zsh
# This script figures out what install scripts to run depending on OS
# TODO: maybe add some user interaction; let them decide what they want to install??
############################

########## Variables

# dotfiles directory
dir=~/dotfiles

# Arch is different
if [ -f /etc/arch-release ] ; then
  sh $dir/installs/arch.sh
else
  # Common files
  sh $dir/installs/common.sh
  # Linux Only
  if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sh $dir/installs/linux.sh
    sh $dir/installs/nix-powerline.sh
  else
    sh $dir/installs/brew.sh
    sh $dir/installs/brew-apps.sh
  fi
fi
