#
# $ cat ~/.zshrc
#

# Split ZSHELL into multiple scripts
for i (~/.zsh/{rc,functions}/*.zsh) {
    source $i
}

# Source RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
