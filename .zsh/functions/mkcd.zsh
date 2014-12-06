#
# ZSHELL mkcd function
#

# Make directory and cd inside it
function mkcd {
    mkdir -p "$*"
    cd "$*"
}
