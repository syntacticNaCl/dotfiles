dir=~/dotfiles
nixfiles="i3 compton polybar rofi terminator" #list of files that should be installed on nix systems only

echo "Installing languages and dependencies..."
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install cmake
sudo apt-get install ruby-full
sudo apt-get install python
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install libsqlite3-dev
sudo apt-get install sqlite3 # for the command-line client
sudo apt-get install bzip2 libbz2-dev

echo "Updating, then installing i3, dmenu, ranger and terminator..."
sudo apt-get update && sudo apt-get install i3 i3lock dmenu ranger terminator rofi silversearcher-ag zsh

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
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce

install_dockerce() {
   echo "Installing docker-ce..."
   sudo apt install docker-ce
}

read -p $'\nIs this the correct docker-ce distribution? ' docker_choice
case "$docker_choice" in
	y|Y ) install_dockerce;;
	n|N ) echo "docker-ce not verified and not installed";;
	  * ) echo "invalid input";;
esac

echo "Installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Creating symlinks for configs..."
for nixfile in $nixfiles; do
ln -sf $dir/.config/$nixfile ~/.config
done
echo "Symlinking finished!"
