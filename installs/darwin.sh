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
    bat
    cmake
    cowsay
    coreutils
    exiftool
    fd
    fortune
    fzf
    git
    gnu-time
    gnupg
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

echo "Installing xcode"
xcode-select --install

echo "Installing Emacs"
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

echo "Cleaning up..."
brew cleanup

echo "All done. Welcome to your new dev box!"
