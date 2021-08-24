#!/bin/bash
############################
# init.zsh
# This script figures out what install scripts to run depending on OS
# TODO: maybe add some user interaction; let them decide what they want to install??
############################

########## Variables

# dotfiles directory
dir=~/dotfiles

# Debian
if command -v apt-get 2>&1 >/dev/null; then
  sh $dir/installs/linux.sh
  sh $dir/installs/nix-powerline.sh
# RHEL
elif command -v rpm 2>&1 >/dev/null; then
  sh $dir/installs/fedora.sh
# Arch
elif command -v pacman 2>&1 >/dev/null; then
  sh $dir/installs/arch.sh
# MacOS
else
  sh $dir/installs/darwin.sh
fi

sh $dir/installs/common.sh
