#
# ZSHELL function yumls
#

function yumls {
    printf '%s ' 'Would you like to see (b)inaries, (c)hangelogs, (d)ocs?'
    read CHOICE

    case $CHOICE in
        b)
            rpm -ql $1 | grep --color=auto 'bin'
            ;;
        c)
            rpm -q --changelog $1 | less
            ;;
        d)
            rpm -qd $1 | grep --color=auto 'doc'
            ;;
        *)
            echo 'Invalid option'
    esac
}
