#==========================
# INSTALL APPS AND BINARIES
# =========================

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install homebrew recipes

binaries=(
    ant
    cmake
    cowsay
    fortune
    git
    imap-uw
    jq
    libtool
    libxml2
    mcrypt
    mercurial
    neon
    ngrep
    node
    pcre
    python
    subversion
    tmux
    wget
    wxmac
    youtube-dl
)

echo "installing binaries..."
brew install ${binaries[@]}

echo "cleaning up"
brew cleanup

#install cask
brew install caskroom/cask/brew-cask

# Apps
apps=(
  airmail
  alfred
  dropbox
  google-chrome
  slack
  filezilla
  phpstorm
  firefox
  spotify
  vagrant
  flash
  iterm2
  shiori
  sublime-text
  virtualbox
  keepassx
  atom
  dash
  vlc
  sequel-pro
  versions
  skype
  utorrent
  hyperdock
  hyperswitch
  skitch
  evernote
  spectacle
  teamviewer
  slate
  screenhero
  spectacle
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Final cleanup..."
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup



echo "Welcome to your new dev box!"
