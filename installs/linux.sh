#!/bin/bash

dir=~/dotfiles
nixfiles="i3 compton polybar rofi terminator" #list of files that should be installed on nix systems only
POWERLINE_FONTS_DIRECTORY="${HOME}/.powerline-fonts"

deps=(
	build-essential
	cmake
	apt-transport-https
	ca-certificates
	curl
	gnupg
	lsb-release
	python
	python3-pip
	python3-dev
	libssl-dev
	libffi-dev
	python3-venv
	nodejs
	npm
	sqlite3
	fonts-powerline
)

apps=(
	i3
	i3lock
	dmenu
	ranger
	terminator
	rofi
	silversearcher-ag
	zsh
	flatpak
	feh
	tmux
	fzf
	ripgrep
	fd
	bat
	neofetch
)

echo "Installing languages and dependencies..."
sudo apt-get update

sudo apt install -y ${deps[@]}
sudo apt install -y ${apps[@]}
sudo apt-get install \
	build-essential \
	cmake \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	python \
	python3-pip \
	python3-dev	\
	libssl-dev \
	libffi-dev \
	python3-venv \
	nodejs \
	npm \
	sqlite3 \
	fonts-powerline

echo "Installing apps..."
sudo apt-get update 
sudo apt-get install -y \
	i3 \
	i3lock \
	dmenu \
	ranger \
	terminator \
	rofi \
	silversearcher-ag \
	zsh \
	flatpak \
	feh \
	tmux \
	fzf \
	ripgrep \
	fd \
	bat \
	neofetch

echo "Building emacs dependencies..."
sudo apt-get build-dep emacs

echo "Building emacs..."
cd /tmp/ && git clone https://github.com/emacs-mirror/emacs.git
cd /tmp/emacs && ./autogen.sh && ./configure && make -j4 && sudo make install
echo "Emacs build finished!"

echo "Installing spacemacs"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

ln -sf $dir/.spacemacs ~/
ln -sf $dir/emacs-private ~/.emacs.d/private

echo "Installing docker and docker-compose..."
sudo apt update && sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install \
	docker-ce \
	docker-ce-cli \
	containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Creating symlinks for configs..."
for nixfile in $nixfiles; do
ln -sf $dir/.config/$nixfile ~/.config/$nixfile
done
echo "Symlinking finished!"

echo "Installing fonts"

# Clone Powerline fonts repo
echo "Cloning 'powerline-fonts' repository..."
git clone https://github.com/powerline/fonts.git "${ZDOTDIR:-$HOME}/dotfiles/"

# Setup powerline-fonts
echo "Configuring powerline-fonts..."
cd ${POWERLINE_FONTS_DIRECTORY}
./install.sh >/dev/null
cd ${DOTFILES_DIRECTORY}

# Set defaults
chsh -s $(which zsh) $USER
