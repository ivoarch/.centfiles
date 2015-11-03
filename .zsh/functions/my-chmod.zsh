my-chmod() {
  stat --format "%a %A %U %n" $* | column -t;
}
