#
# ZSHELL function gmod
#

gmod() {
    stat --format "%n %a" $* | column -t;
}
