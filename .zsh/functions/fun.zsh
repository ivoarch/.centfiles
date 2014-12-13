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

# https://bbs.archlinux.org/viewtopic.php?pid=1434331#p1434331
zebra(){
if [[ -t 1 ]]; then
  cols=$(tput cols)
  # apply zebra striping
  for ((r=0;;r=1-r)); do
    IFS='' read -r line || break
    (( r )) && printf '\x1b[40m'
    printf "%-${cols}s\n" "${line:0:$cols}"  # trim or pad
    (( r )) && printf '\x1b[m'
  done
else
  cat
fi
}

# fortune cookie
#fortune -s | cowsay
#fortune | cowsay -f $(ls /usr/share/cowsay/ | shuf -n1)
