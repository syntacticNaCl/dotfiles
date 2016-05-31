# Make sure everything is up-to-date
echo "First let's update"
brew update && brew upgrade brew-cask

# Apps
apps=(
  airmail
  alfred
  dropbox
  google-chrome
  slack
  forklift
  emacs
  phpstorm
  firefox
  vagrant
  flash
  iterm2
  sublime-text
  virtualbox
  keepassx
  atom
  dash
  vlc
  sequel-pro
  skype
  hyperdock
  hyperswitch
  evernote
  slate
  screenhero
  spectacle
  libreoffice
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Cleanup

echo "Final cleanup..."
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

echo "All Done."
