#!/bin/bash
############################
# init.zsh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
POWERLINE_FONTS_DIRECTORY="${HOME}/.powerline-fonts"
PREZTO_DIRECTORY="${HOME}/.zprezto"
files="exports gitinfo vimrc zpreztorc zprofile zshenv zshrc vim zprezto zsh fonts"    # list of files/folders to symlink in homedir
nixfiles="i3" #list of files that should be installed on nix systems only

##########

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

# Clone Powerline fonts repo
echo "Cloning 'powerline-fonts' repository..."
git clone https://github.com/powerline/fonts.git "${ZDOTDIR:-$HOME}/dotfiles/"

# Setup powerline-fonts
echo "Configuring powerline-fonts..."
cd ${POWERLINE_FONTS_DIRECTORY}
./install.sh >/dev/null
cd ${DOTFILES_DIRECTORY}

# Clone the upstream Prezto repo
echo "Cloning 'prezto' repository..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/dotfiles/.zprezto"

#change shell to zsh if set to something else
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

#install dev stuff
echo "Installing and moving composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/

echo "Installing grunt-cli..."
sudo npm install -g grunt-cli

echo "Installing sass..."
sudo gem install sass

# Linux Only
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Updating, then installing i3, dmenu, ranger and terminator..."
    sudo apt-get update && sudo apt-get install i3 i3lock dmenu ranger terminator 

    echo "Moving i3 configs..."
    for nixfile in $nixfiles; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$nixfile ~/dotfiles_old/
	echo "Creating symlink to $nixfile in home directory."
	ln -s $dir/.$nixfile ~/.$nixfile
    done
    #copy terminator config
    #TODO need a more elegant solution for this... but im tired and i want to go to bed, duh duh duh
    cp -r $dir/.config/terminator ~/.config
fi
