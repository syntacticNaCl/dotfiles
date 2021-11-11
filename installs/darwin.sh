#==========================
# INSTALL APPS AND BINARIES
# =========================

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

# Install homebrew recipes
binaries=(
    aspell
    cmake
    cowsay
    exiftool
    fd
    fortune
    fzf
    git
    gotop
    imap-uw
    irssi
    jq
    libtool
    libxml2
    neofetch
    neovim
    ngrep
    node
    python
    reattach-to-user-namespace
    ripgrep
    ruby
    starship
    svn #unfortunately needed for cask-fonts
    tig
    tmux
    vim
    wget
    youtube-dl
)

casks=(
    alfred
    bitwarden
    emacs
    firefox
    gimp
    iterm2
    libreoffice
    rectangle
    standard-notes
    tableplus
    textmate
    visual-studio-code
    vlc
)

fonts=(
    font-powerline-symbols
    font-source-code-pro
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Setting defaults"
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Set default shell
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

echo "Installing casks..."
brew install --cask ${casks[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask ${fonts[@]}

echo "Cleaning up..."
brew cleanup

echo "All done. Welcome to your new dev box!"
