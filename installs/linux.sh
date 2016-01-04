dir=~/dotfiles
nixfiles=".i3" #list of files that should be installed on nix systems only

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

#Python 3 install
wget http://www.python.org/ftp/python/3.3.5/Python-3.3.5.tar.xz
tar xJf ./Python-3.3.5.tar.xz
cd ./Python-3.3.5
./configure --prefix=/opt/python3.3
make && sudo make install
mkdir ~/bin
ln -s /opt/python3.3/bin/python3.3 ~/bin/py

echo "Cleaning up"
rm -rf Python-3.3.5
rm Python-3.3.5.tar.xz

echo "Updating, then installing i3, dmenu, ranger and terminator..."
sudo apt-get update && sudo apt-get install i3 i3lock dmenu ranger terminator

echo "Moving i3 configs..."
for nixfile in $nixfiles; do
echo "Moving any existing dotfiles from ~ to $olddir"
mv ~/$nixfile ~/dotfiles_old/
echo "Creating symlink to $nixfile in home directory."
ln -s $dir/$nixfile ~/$nixfile
done
#copy terminator config
#TODO need a more elegant solution for this... but im tired and i want to go to bed, duh duh duh
cp -r $dir/.config/terminator ~/.config
