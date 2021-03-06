# -------------------------------------------------------------------
# EXPORTS
# -------------------------------------------------------------------

export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin/nodejs:$PATH
export PATH=~/.config/composer/vendor/bin:$PATH

## GOLANG
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Make vim the default editor
export EDITOR="vim"
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"
# set $SHELL
export SHELL="/usr/local/bin/zsh"
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# GTAGS
export GTAGSLABEL=pygments

# fix render issues
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)
