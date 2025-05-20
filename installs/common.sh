#!/bin/bash
############################
# init.zsh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".zprofile .zshenv .zshrc .zsh .tmux.conf .config/nvim"    # list of files/folders to symlink in homedir

##########

# Create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# Clone tpm for tmux plugin management
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Emacs
ln -sf $dir/emacs-private/functions ~/.emacs-d/private/functions
ln -sf $dir/emacs-private/local ~/.emacs-d/private/local
ln -sf $dir/emacs-private/snippets ~/.emacs-d/private/snippets

# Vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
ln -s $dir/.doom.d ~/.doom.d
~/.emacs.d/bin/doom install

touch ~/.zsh_secrets
