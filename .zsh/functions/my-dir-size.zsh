my-dir-size(){
  pushd "$1"
  du --max-depth=1 -h . 2> /dev/null |sort -n
  popd
}
