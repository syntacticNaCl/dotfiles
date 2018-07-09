# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
 
# return my IP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# determine local IP address
ips () {
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# Kills any process that matches a regexp passed to it
killit() {
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# directory LS
dls () { 
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

# A recursive, case-insensitive grep that excludes binary files
dgrep() { 
    grep -iR "$@" * | grep -v "Binary"
}

# A recursive, case-insensitive grep that excludes binary files
# and returns only unique filenames
dfgrep() {
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

#Search for process passed
psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

dict() {
    grep "$@" /usr/share/dict/words
}

#extract file types
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#gpg verify
gpgv () {
	if [$1=""] || [$2=""] ; then
		echo "gpg verify accepts two parameters (sig, source)"
	else
		gpg --verify $1 $2
	fi

}

#zip and encrypt archive
#generate random password
zencrypt() {
	date +%s | shasum -a 1 | base64 | head -c 32 ; echo
	zip -er $1.zip $1
	cls
	echo "remember to clear your clipboard :)"
}

#change PHP versions
phpv() {
	export PATH="$(brew --prefix homebrew/php/$1)/bin:$PATH"
}

#mysqldump it
dumpit() {
	DATE=`date +%Y-%m-%d`
	sudo mysqldump -u root -p $1 > $DATE-$1-local-dump.sql 
}

vcheck() {
    openssl dgst -$1 $2
}

## File searching

# find word in files
grepf() {
    grep -rnw $1 -e "$2"
}

# find count of word in files
grepfc() {
    grep -rnw $1 -e "$2" | wc -l
}

# print out tmux colour palette
tmux_colors() {
    for i in {0..255} ; do
	printf "\x1b[38;5;${i}mcolour${i}\n"
    done 
}

## Commandline Fu
cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
    | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;}

##Check if websites are down
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

## Vim help page
:h()  { vim +":h $1" +'wincmd o' +'nnoremap q :q!<CR>' ;}

##############################################################
######################## LIVE STREAMS ######################## 
##############################################################

# Because Mac is weird with livestreamer
if [[ $OSTYPE == 'darwin'* ]]; then
	PLAYER=''
else
	PLAYER='-p mplayer'
fi

TV-m() { livestreamer -p mplayer "$1" best ;}
TV-v() { livestreamer -p vlc "$1" best ;}

# Twitch
TwitchQuill() { livestreamer $PLAYER http://www.twitch.tv/quill18 best; }
TwitchGeek() { livestreamer $PLAYER www.twitch.tv/geekandsundry best; }
TwitchHandmade() { livestreamer $PLAYER www.twitch.tv/handmade_hero best; }

# Music
usic() { sudo killall mpd && mpd && ncmpcpp }
youtube-dl-m(){ youtube-dl --extract-audio --audio-format mp3 -l "$1"; }

# Shows
stream-sp(){ livestreamer $PLAYER veetle.com/index.php/channel/view/541c316fe8423/d6fb77db53674e6395c04d2c16bb0951 best; }
stream-simp(){ livestreamer $PLAYER veetle.com/index.php/channel/view/52dada61bdf13/34cb225e471c64e9b611cc39fa1a45b1 best; }
stream-bbt(){ livestreamer $PLAYER vaughnlive.tv/highspothorror101 best; }
stream-dw(){ livestreamer $PLAYER veetle.com/index.php/channel/view/4c8416bb6a612/6115b84a8270b63c699ecea0b7eb5150 best; }
stream-qi(){ livestreamer $PLAYER vaughnlive.tv/qinteresting best; }
stream-twit(){ livestreamer $PLAYER www.ustream.tv/leolaporte best; }

# Space
stream-nasa(){ livestreamer $PLAYER www.ustream.tv/nasahdtv best; }
stream-nasaearth(){ livestreamer $PLAYER www.ustream.tv/channel/iss-hdev-payload best; }
stream-iss(){ livestreamer http://www.ustream.tv/channel/live-iss-stream best; }
stream-jupiter() { livestreamer $PLAYER http://www.ustream.tv/channel/jupiterbroadcasting 720p+_alt_akamai ;}
# Figlet

pandora-cli() { clear && figlet -c Pandora CLI && pianobar ;}

## Git
gbnuke() {
   git branch -D $1; git push origin :$1; 
}

## Check sha256
shacheck-m() { shasum -a 256 $1 }

shacheck-l() { sha256sum $1 }

## Flush DNS cache on Mac for OS X Yosemite or El Capitan
dnsflush-m() {
	sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed
}

timestamp() {
  date +"%T"
}

dotouch() {
    $DATETIME=date +"%Y-%m-%d_%H-%M-%S"
    touch $DATETIME_$1.org
}
