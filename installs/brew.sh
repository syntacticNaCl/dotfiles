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
	aspell
    cmake
    cowsay
    fortune
    git
    imap-uw
    irssi
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
    pianobar
    reattach-to-user-namespace
    subversion
    tmux
    vim
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

sh brew-apps.sh

echo "Welcome to your new dev box!"
