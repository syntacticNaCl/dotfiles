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
source ~/.zshenv

#------------------------------------------
# STARTUP
#------------------------------------------
if ! command -v neofetch &> /dev/null; then
    neofetch
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

. /usr/local/opt/asdf/libexec/asdf.sh
