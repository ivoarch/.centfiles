#!/bin/bash
# source: https://askubuntu.com/questions/34010/keyboard-shortcut-to-hide-unhide-the-panel

count=0
while read line
do
  keys[$((++count))]="${line}/auto_hide"
done <<EOF
    $( gconftool-2 --all-dirs "/apps/panel/toplevels" )
EOF

case $( gconftool-2 --get "${keys[1]}" ) in
  "0" | "false" | "False" )
    new="true"
    ;;
  * )
    new="false"
    ;;
esac

for key in "${keys[@]}"
do
  gconftool-2 --set "$key" --type bool "$new"
done