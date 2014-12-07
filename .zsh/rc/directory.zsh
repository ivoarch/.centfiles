# Most of these options are used for quick navigation.
setopt autocd                  # change to dirs without cd
setopt pushd_to_home           # Push to home directory when no argument is given.
setopt auto_pushd              # Push the old directory onto the stack on cd.
setopt auto_name_dirs          # Auto add variable-stored paths to ~ list.
setopt pushd_ignore_dups       # Do not store duplicates in the stack.

alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

cd () {
    if [[ "x$*" == "x..." ]]; then
      cd ../..
    elif [[ "x$*" == "x...." ]]; then
      cd ../../..
    elif [[ "x$*" == "x....." ]]; then
      cd ../../..
    elif [[ "x$*" == "x......" ]]; then
      cd ../../../..
    else
      builtin cd "$@"
    fi
}
