#
# ZSHELL autoload
#

# Functions to make it easier to type URLs as command line arguments.
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# load colors
#autoload -U colors && colors
