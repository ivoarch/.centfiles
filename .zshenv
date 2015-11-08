# $ cat ~/.zshenv
# Used for setting some useful environment variables

# Profile
export MAIL="ivkuzev[at]gmail[dot]com"
export PGPPATH="$HOME/.gnupg"
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="firefox"

# default env vars (if not set)
if [[ -z "$TERM" ]]; then
    export TERM=xterm-256color
fi
if [[ -z "$EDITOR" ]]; then
    export EDITOR=emacs
    export VISUAL=$EDITOR
fi

export DISPLAY=":0.0"

# Setup Go
export GOROOT=$HOME/.go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/.gocode
export PATH=$HOME/.gocode/bin:$PATH

# Encoding
#export LANG="us_US.UTF-8"
#export LC_ALL=$LANG
#export LC_COLLATE=$LANG
#export LC_CTYPE=$LANG
#export LC_MESSAGES=$LANG
#export LC_MONETARY=$LANG
#export LC_NUMERIC=$LANG
#export LC_TIME=$LANG
#export LC_NAME=$LANG
#export LC_TELEPHONE=$LANG
#export LESSCHARSET="UTF-8"

# Colorized_manpages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;35m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[01;46;37m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline

# http://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1
