# Check if a URL is up
function chk-url() {
  curl -sL -w "%{http_code} %{url_effective}\\n" "$1" -o /dev/null
}
