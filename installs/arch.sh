
#!/bin/bash
############################
# arch.zsh
# Install script for my Arch
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="exports gitinfo zpreztorc zprofile zshenv zshrc zprezto zsh tmux.conf"    # list of files/folders to symlink in homedir
packages="neovim livestreamer weechat tmux conky zsh firefox ranger"

##########

## Install
echo 'First lets make sure everything is up to date...'
sudo pacman -Syu

#install packages
echo "Installing necessary packages. Please wait..."
for package in $packages; do
  if [pacman -Q $package >/dev/null] ; then
    echo "$package is already installed";
  else
    sudo pacman -S $package
  fi
done

# NVIM
ln -s $dir/.nvim ~/.config/nvim

# Clone Powerline fonts repo
yaourt -S python2-powerline-git

# Clone the upstream Prezto repo
echo "Cloning 'prezto' repository..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/dotfiles/.zprezto"

#change shell to zsh if set to something else
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

## Backup and Symlink
# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# Test if Composer is installed
composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?

# True, if composer is not installed
if [[ $COMPOSER_IS_INSTALLED -ne 0 ]]; then
    echo ">>> Installing Composer"
    # Install Composer
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
else
    echo ">>> Updating Composer"
    composer self-update
fi

# Setup zsh
echo "Setting up zsh..."

# Add my secrets file for stuff I dont want version controlled
touch $dir/.zsh_secrets

# link my custom zsh theme
ln -s $dir/prompt_jedi_setup $dir/.zprezto/modules/prompt/functions/prompt_jedi_setup

source ~/.zshrc

echo 'All done.'
