#
# $ cat ~/.zshrc
#

#export ZDOTDIR=~/.zsh

# Split ZSHELL into multiple scripts
for i (~/.zsh/{rc,functions,plugins}/*.zsh) {
    source $i
}

# Source RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Run on new shell
fortune -s | cowsay
