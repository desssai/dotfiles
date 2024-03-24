#!/bin/sh

devices=($(bluetoothctl devices | cut -f2 -d' '))

for i in "${!devices[@]}"; do
  text+=$(bluetoothctl info ${devices[i]} | grep 'Name\|Connected' | sed 's/.//' | yq)
done

echo $text | jq 
# bluetoothctl devices | cut -f2 -d' ' | 
#   while read uuid; do
#     devices[i]="$(bluetoothctl info $uuid | grep 'Name\|Connected' | sed 's/.//; s/Connected/\nConnected/')"
#     i=$((i+1))
#   done

# echo "DP array size is %d\n" "${#devices[@]}"
# echo "%s " "${devices[@]}"
# echo "\n"
# echo ${devices[*]}
