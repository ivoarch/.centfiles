#
# ZSHELL aliases
#

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# copy current working directory to clipboard
alias cwd="pwd | tr -d '\n' | xsel -b"
alias copy="xsel -b"

# Compile/Sources
alias cm='./configure && make'
alias mmi='make && sudo make install'
alias pmmi='perl Makefile.PL && mmi'
alias maek='make'
alias mkae='make'
alias pipr='pip install --no-deps --ignore-installed'

# Emacs
alias emacs='emacsclient -ca'
alias ec='emacsclient -c'
alias et='emacsclient -t'
alias eamcs='emacs'
alias emcs='emacs'
alias em='emacsclient -n -a ""'
alias es="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias E='es'

# General
alias cp='cp -RPv'
alias mk='mkdir -p'
alias mkdir='mk'
alias mv='mv -i'
alias wget='wget -c'
alias history='fc -l 1'
alias h='history'
alias ssh='ssh -X'
alias free='free -m'
alias open='xdg-open'
alias c='clear'
alias cc='cd;clear'
alias q='exit'
alias Q='q'
alias t='touch'
alias j='jobs'
alias extract='dtrx'

# ls helpers
alias ls='ls -Xp --color=auto'
alias la='ls -a'
alias l.='ls -d .*'
alias ll='ls -lh'
alias l='ls -lh'
alias lr='ls -lR'

# Dig aliases
alias digs='dig +short'
alias digc='dig +short CNAME'
alias digns='dig +short NS'
alias digmx='dig +short MX'

# make rm verbose and ask for confimation before deletion
alias rm='rm -vi'

# Auto extension stuff
# Suffix
alias -s {ogg,mp3,wav,wma}="mplayer"
alias -s {avi,mpeg,mpg,mov,m2v,flv}="mplayer"
alias -s {png,gif,jpg,jpeg}="gthumb"
alias -s {doc,pdf}="$EDITOR"
alias -s {txt,c,h,conf,tex}="$EDITOR"
alias -s {html,php,com,net,org,gov}="$BROWSER"
alias -s torrent='transmission-gtk'

# No correct commands
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias sudo='nocorrect sudo'
alias git='nocorrect git'
alias ack='nocorrect ack'

# Global
alias -g G="| grep -i --color=auto"
alias -g EG="| egrep -i --color=auto"
alias -g L='| less'
alias -g S='| sort'
alias -g X='| xargs'
alias -g T='| tail'
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
