#!/bin/bash
############################
# init.zsh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

sh ./$dir/installs/common.sh

# Linux Only
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sh ./$dir/installs/linux.sh
    sh ./$dir/installs/nix-powerline.sh
fi
