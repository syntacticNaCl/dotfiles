# -------------------------------------------------------------------
# SOURCES
# -------------------------------------------------------------------

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
mpd

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/config.zsh
source ~/.zsh_secrets

#------------------------------------------
# STARTUP
#------------------------------------------
if [ -x /usr/local/bin/screenfetch -o -x /usr/bin/screenfetch ]; then
    screenfetch
elif [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune ]; then
    fortune | cowsay -f vader
fi


