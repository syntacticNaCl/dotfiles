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
