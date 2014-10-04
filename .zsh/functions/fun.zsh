#
# ZSHELL function fun
#

fliptable() {
    clear;
    echo "";
    echo "FUCK IT!（╯°□°）╯ ┻━┻";
}

pi() {
    seq -f '4/%g' 1 2 99999 | paste -sd-+ | bc -l
}

# fortune cookie
#fortune -s | cowsay
#fortune | cowsay -f $(ls /usr/share/cowsay/ | shuf -n1)
