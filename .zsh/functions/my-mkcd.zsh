#
# ZSHELL mkcd function
#

# Make directory and cd inside it
my-mkcd() {
    mkdir -p "$*"
    cd "$*"
}
