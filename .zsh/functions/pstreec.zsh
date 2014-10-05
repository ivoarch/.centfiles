#
# ZSHELL function pstreec
# pstree with colour output

# https://bbs.archlinux.org/viewtopic.php?pid=1136547#p1136547
pstreec() {
		pstree -U "$@" | sed '
            s/[-a-zA-Z]\+/\x1B[32m&\x1B[0m/g
            s/[{}]/\x1B[31m&\x1B[0m/g
            s/[─┬─├─└│]/\x1B[34m&\x1B[0m/g'
}
