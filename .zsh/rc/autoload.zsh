#
# ZSHELL autoload
#

# Functions to make it easier to type URLs as command line arguments.
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# load colors
#autoload -U colors && colors
