# -------------------------------------------------------------------
# EXPORTS
# -------------------------------------------------------------------

export PATH=/usr/local/bin:$PATH

# # PHP MAMP

#export PATH="/Applications/MAMP/bin/php/php5.4.34/bin:$PATH"
export PATH="/Applications/MAMP/bin/php/php5.3.29/bin:$PATH"

# # MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# # Subversion
export PATH=/opt/subversion/bin:$PATH

# # ANT
export PATH="/usr/share/ant/bin/ant:$PATH"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Directories to Export into $PATH
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH
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
# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# if [[ "$OSTYPE" == ^darwin ]]
# then
#     # Setup Amazon EC2 Command-Line Tools
#     export EC2_HOME=~/Dropbox/.ec2
#     export PATH=$PATH:$EC2_HOME/bin
#     export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
#     export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
# fi

export JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
export JAVA7_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$JAVA6_HOME
# export MAVEN_HOME=/usr/local/Cellar/maven/


# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)