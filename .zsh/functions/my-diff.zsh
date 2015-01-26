if command -v colordiff > /dev/null 2>&1; then
  alias my-diff="colordiff -Nuar"
else
  alias my-diff="diff -Nuar"
fi
