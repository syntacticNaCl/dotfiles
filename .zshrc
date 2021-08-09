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
# STARTUP
#------------------------------------------
if [ -x $(which neofetch) ]; then
    neofetch
elif [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune ]; then
    fortune | cowsay -f vader
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
