#
# ZSHELL checks
#

if [[ $(uname) = 'Linux' ]]; then
  IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
  IS_MAC=1
fi

if [[ $(tty|grep -o '/dev/tty') = /dev/tty ]]; then
  IN_TTY=1
fi
