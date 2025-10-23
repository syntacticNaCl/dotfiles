# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------

alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gpush='git push'
alias gpusho='git push origin'
alias gpushom='git push origin master'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdf='git diff --name-status'
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
alias gpullo='git pull origin'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gstash='git stash'
alias grefresh='git stash; git pull origin master'
alias greset='git fetch --all; git reset --hard origin/master'
alias getB="git branch -a | grep $1"
alias CB="git branch | awk '/^*/{print $2}'"
alias brname='git branch -m'
alias cb='git branch | awk '\''/^*/{print }'\'''
alias gL='git log --oneline'
alias gM='git log --merges --oneline'

# -------------------------------------------------------------------
# Docker aliases
# -------------------------------------------------------------------
alias D='docker exec -it'
alias DE='docker exec -it'
alias DC='docker container'
alias Dcls='docker container ls'
alias DI='docker image'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

# -------------------------------------------------------------------
# Tmux aliases
# -------------------------------------------------------------------
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new -s'
alias tks='tmux kill-session -t'

# -------------------------------------------------------------------
# VIM
# -------------------------------------------------------------------
alias vi="nvim"
alias vim="nvim"
alias svi="sudo nvim" # Run nvim as super user
alias svim="sudo nvim" # Run nvim as super user

# -------------------------------------------------------------------
# Claude Code
# -------------------------------------------------------------------
alias cl="claude"
alias clusage="bunx ccusage"

# -------------------------------------------------------------------
# Zsh aliases
# -------------------------------------------------------------------
alias rzsh='source ~/.zshrc'
alias R='source ~/.zshrc'

# -------------------------------------------------------------------
# FZF aliases
# -------------------------------------------------------------------
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'
alias vifi='vim $(fzfi)'

# -------------------------------------------------------------------
# Directory aliases
# -------------------------------------------------------------------

alias grep='grep --color=auto' # Always highlight grep search term
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias C='clear'
alias tt='tt++ $HOME/.ttconf'

# Directory traversing
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias /='cd /'
alias ~='cd ~'

# Dir Lists
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

# -------------------------------------------------------------------
# Utilities
# -------------------------------------------------------------------

alias myssh="pbcopy < ~/.ssh/id_rsa.pub"
alias cat="bat"
alias e="emacs"
# Run emacs without X
alias ec="emacs -nw"

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

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias updateall='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias update='brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# switch java versions
alias setJdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

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
# Theming
# -------------------------------------------------------------------
alias eZ='vim ~/dotfiles/.zsh'
alias eT='vim ~/dotfiles/.tmux.conf'
alias eI='vim ~/dotfiles/.i3/config'
alias eV='vim ~/dotfiles/.config/nvim/init.lua'
alias eD='vim ~/dotfiles'

# -------------------------------------------------------------------
# Livestreamer 
# -------------------------------------------------------------------
alias twit='livestreamer http://www.ustream.tv/leolaporte best'
alias nasa='livestreamer http://www.ustream.tv/nasahdtv best'
alias nasaearth='livestreamer http://www.ustream.tv/channel/iss-hdev-payload best'
alias iss='livestreamer http://www.ustream.tv/channel/live-iss-stream best'
