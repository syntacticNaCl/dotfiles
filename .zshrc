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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
