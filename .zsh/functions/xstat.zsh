# https://moiseevigor.github.io/software/2015/01/30/get-file-creation-time-on-linux-with-ext4/
xstat() {
  for target in "${@}"; do
    inode=$(ls -di "${target}" | cut -d ' ' -f 1)
    fs=$(df "${target}"  | tail -1 | awk '{print $1}')
    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null |
    grep -oP 'crtime.*--\s*\K.*')
    printf "%s\t%s\n" "${crtime}" "${target}"
  done
}
