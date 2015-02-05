my-chmod() {
  stat --format "%n %a" $* | column -t;
}
