#==========================
# INSTALL APPS AND BINARIES
# =========================

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Homebrew is already in .zprofile; just need it to work during install
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
brew update

# Install homebrew recipes
binaries=(
    aspell
    asdf
    bash # important to ensure an up-to-date bash version is installed
    bat
    cmake
    cowsay
    coreutils
    exiftool
    fd
    fortune
    fzf
    deno
    git
    gnu-time
    gnupg
    gotop
    go
    golangci-lint
    imap-uw
    irssi
    jq
    lazygit
    libtool
    libxml2
    luarocks
    neovim
    ngrep
    node
    python
    reattach-to-user-namespace
    ripgrep
    ruby
    starship
    svn #unfortunately needed for cask-fonts
    tldr
    tig
    tmux
    vim
    wget
    zsh-autosuggestions
)

casks=(
    alfred
    bitwarden
    firefox
    gimp
    iterm2
    rectangle
    tableplus
    visual-studio-code
    vlc
)

fonts=(
    font-powerline-symbols
    font-source-code-pro
    font-fira-code-nerd-front
    font-fira-mono-nerd-front
    font-symbols-only-nerd-font
    font-mononoki-nerd-font
    font-maple-mono
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
brew install --cask ${fonts[@]}

echo "Installing xcode"
xcode-select --install

echo "Installing Emacs"
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@30/Emacs.app" at posix file "/Applications" with properties {name:"Emacs.app"}'

echo "Cleaning up..."
brew cleanup

echo "All done. Welcome to your new dev box!"
