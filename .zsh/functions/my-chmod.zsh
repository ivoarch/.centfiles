my_chmod() {
  stat --format "%n %a" $* | column -t;
}
