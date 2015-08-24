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

# Cleanup

echo "Final cleanup..."
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

echo "All Done."