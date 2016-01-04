# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------

alias ga='git add'
alias gaa='git add -A'
alias gpush='git push'
alias gpushom='git push origin master'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdrb='git push origin --delete'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add origin'
alias grr='git remote rm'
alias gpull='git pull'
alias gpullom='git pull origin master'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gstash='git stash'
alias grefresh='git stash; git pull origin master'
alias greset='git fetch --all; git reset --hard origin/master'

# -------------------------------------------------------------------
# SVN aliases
# -------------------------------------------------------------------

alias svnc='sudo svn commit -m'
alias svna='sudo svn add'
alias svnu='sudo svn update'
alias svnforce='sudo svn update --force'
alias svns='sudo svn status'
alias rmsvn="find . -type d -name .svn -exec rm -rf {} \;"
alias svnln='svn st | grep -e "^?"'
alias svnadd='svn add `svnln | cut -d " " -f 8`'
alias svnm="svn stat|grep '^M'"
alias sugarsvn='sudo svn add custom modules --force'
alias svnun='sudo svn status | grep ^?'

# -------------------------------------------------------------------
# Cordova aliases
# -------------------------------------------------------------------

alias cba='cordova build android'
alias cea='cordova emulate android'
alias crdroid='cordova platform rm android'
alias cadroid='cordova platform add android'
alias crios='cordova platform rm ios'
alias caios='cordova platform add ios'

# -------------------------------------------------------------------
# Sencha aliases
# -------------------------------------------------------------------

alias swstart="sencha web start"
alias shelp="sencha help"
alias st="sencha -sdk ~/Downloads/touch-2.1.1 "
alias stg="sencha generate"
alias stgc="sencha generate controller"
alias stgv="sencha generate view"
alias stgm="sencha generate model"
alias sab="sencha app build"
alias sabp="sencha app build production"

# -------------------------------------------------------------------
# Tmux aliases
# -------------------------------------------------------------------
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# -------------------------------------------------------------------
# Directory aliases
# -------------------------------------------------------------------

alias grep='grep --color=auto' # Always highlight grep search term
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias cls='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
alias cl='clear'
alias C='clear'
alias tt='tt++ $HOME/.ttconf'

#convert vi to vim; LAAAZZZYYY
alias vi="nvim"
alias vim="nvim"
alias svi="sudo nvim" # Run nvim as super user
alias svim="sudo nvim" # Run nvim as super user

#Directory traversing
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias /='cd /'
alias ~='cd ~'

# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias h="history"

#Dir Lists
alias lsa='ls -lah'
alias lsd="ls -ld *" # show directories
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias ltd='ls *(m0)' # files & directories modified in last day
alias lt='ls *(.m0)' # files (no directories) modified in last day
alias lnew='ls *(.om[1,3])' # list three newest
alias oo='open .' # open current directory in OS X Finder

# -------------------------------------------------------------------
# Permissions aliases
# -------------------------------------------------------------------

alias mod7='sudo chmod -R 777'
alias mod75='sudo chmod -R 775'
alias unstick='sudo chmod -R g-s'

# -------------------------------------------------------------------
# Network/Web aliases
# -------------------------------------------------------------------

# curl for useragents
alias iecurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)\""
alias ffcurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.0 (.NET CLR 3.5.30729)\""

alias grep='grep --color=auto' # Always highlight grep search term
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited

alias iwconfig='iwconfig wlan0'
alias exip='curl ip.appspot.com'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#Web Serve
alias macvhost="sudo vim /etc/apache2/extra/httpd-vhosts.conf"

#Composer
alias composer="php /usr/local/bin/composer"

#Grunt
alias gruntit="npm install grunt --save-dev"

#Compass watch
alias bcwatch="bundle exec compass watch"

#Vagrant
alias vprovision="vagrant upgrade --provision"

#Node
alias npmi="sudo npm install"

#Bower
alias bowi="bower install"

#Dev setup
alias s8init="sudo npm install && bower install"

# -------------------------------------------------------------------
# Utilities
# -------------------------------------------------------------------

alias myssh="pbcopy < ~/.ssh/id_rsa.pub"

# -------------------------------------------------------------------
# MakeMacBetter aliases
# -------------------------------------------------------------------

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false &&
killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true &&
killall Finder"

#Hide/show all files
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES"

# become root #
alias root='sudo -i'
alias su='sudo -i'

# apache (mac) #
alias arestart='sudo apachectl restart'
alias astart='sudo apachectl start'
alias astatus='sudo apachectl status'
alias astop='sudo apachectl stop'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# switch java versions
alias setJdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

alias vi="vim"

# Update zshrc changes
alias rzsh='source ~/.zshrc'
alias R='source ~/.zshrc'

# Clear that download log
alias cleardl="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# -------------------------------------------------------------------
# Fun stuff
# -------------------------------------------------------------------

alias nethack='telnet nethack.alt.org'
alias telehack= 'telnet telehack.com'
alias starwars= 'telnet towel.blinkenlights.nl 23'
alias weather= 'telnet rainmaker.wunderground.com'
alias chess= 'telnet freechess.org'
alias nyancat= 'telnet miku.acm.uiuc.edu'
alias fatcats= 'telnet fatcatsbbs.com'

# -------------------------------------------------------------------
# Livestreamer 
# -------------------------------------------------------------------
alias twit='livestreamer http://www.ustream.tv/leolaporte best'
alias nasa='livestreamer http://www.ustream.tv/nasahdtv best'
alias nasaearth='livestreamer http://www.ustream.tv/channel/iss-hdev-payload best'
alias iss='livestreamer http://www.ustream.tv/channel/live-iss-stream best'
