# -------------------------------------------------------------------
# EXPORTS
# -------------------------------------------------------------------

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Make vim the default editor
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH

## Langs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
. "$HOME/.cargo/env"

## Doom emacs
export PATH=$PATH:$HOME/.emacs.d/bin

## ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Add homebrew to the completion path
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  FPATH=${ASDF_DATA_DIR:-$HOME/.asdf}/completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Fix gpg errors
GPG_TTY=$(tty)
export GPG_TTY
