#
# ZSHELL aliases
#

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
alias d='dirs -v | head -10'

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

# YUM
alias yumc='sudo yum clean all' # Cleans the cache.
alias yumh='yum history'        # Displays history.
alias yumi='sudo yum install'   # Installs package(s).
alias yuml='yum list'           # Lists packages.
alias yumL='yum list installed' # Lists installed packages.
alias yumq='yum info'           # Displays package information.
alias yumr='sudo yum remove'    # Removes package(s).
alias yums='yum search'         # Searches for a package.
alias yumu='sudo yum update'    # Updates packages.
alias yumU='sudo yum upgrade'   # Upgrades packages.

# Adding, Enabling, and Disabling a Yum Repository.
alias addrepo='sudo yum-config-manager --add-repo'
alias enablerepo='sudo yum-config-manager --enable'
alias disablerepo='sudo yum-config-manager --disable'

# Show priority scores.
alias priority='sed -n -e "/^\[/h; /priority *=/{ G; s/\n/ /; s/ity=/ity = /; p }" /etc/yum.repos.d/*.repo | sort -k3n'

# General
alias cp='cp -RPv'
alias la='ls -a'
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias ls='ls -Xp --color=auto'
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
alias q='exit'
alias Q='q'
alias t='touch'
alias j='jobs'
alias extract='dtrx'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias agrep='ack-grep --color'

# make rm verbose and ask for confimation before deletion
alias rm='rm -vi'

# Auto extension stuff
alias -s {ogg,mp3,wav,wma}="mplayer"
alias -s {avi,mpeg,mpg,mov,m2v,flv}="mplayer"
alias -s {png,gif,jpg,jpeg}="gthumb"
alias -s {doc,pdf}="$EDITOR"
alias -s {txt,c,h,conf,tex}="$EDITOR"
alias -s {html,php,com,net,org,gov}="$BROWSER"
alias -s torrent='transmission-gtk'

# Network
alias myip='curl ifconfig.me'
alias myserver='python -m SimpleHTTPServer 8000'
alias myspeed='speedtest-cli --simple'
# Download files from a web directory
alias myget="wget -r -nd -l 1 -A"
alias ipsort='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

# No correct commands
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias sudo='nocorrect sudo'

# Global
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g M="| most"
alias -g B="&|"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
