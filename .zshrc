# -------------------------------------------------------------------
# SOURCES
# -------------------------------------------------------------------

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/config.zsh
source ~/.zsh_secrets

#------------------------------------------
# COWSAY FORTUNE
#------------------------------------------
if [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune ]; then
	    fortune | cowsay
fi
