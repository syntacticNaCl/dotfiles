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
# cd /tmp/ && git clone https://github.com/emacs-mirror/emacs.git
# cd /tmp/emacs && ./autogen.sh && ./configure && make -j4 && sudo make install
echo "Emacs build finished!"

echo "Installing spacemacs"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

ln -sf $dir/.spacemacs ~/
ln -sf $dir/emacs-private ~/.emacs.d/private

echo "Creating symlinks for configs..."
for nixfile in $nixfiles; do
ln -sf $dir/.config/$nixfile ~/.config
done
echo "Symlinking finished!"
