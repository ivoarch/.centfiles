# list external/local IP
my-ip() {
    echo -n "Current External IP: "
    curl ifconfig.me
    echo -n "Local IP address: "
    ifconfig | grep "inet " | awk '{ print $2 }'
}
