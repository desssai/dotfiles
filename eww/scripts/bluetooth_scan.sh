#!/bin/expect -f

spawn bluetoothctl
send "scan on\r"

# info (){
# 	power=$(bluetoothctl show | grep Powered | awk '{print $2}' | sed 's/yes/on/g; s/no/off/g')
# 	count=$(bluetoothctl devices Connected | wc -l)
# 	echo "{\"power\": \"${power}\", \"count\": \"${count}\"}"
# }

# info
# dbus-monitor --system "sender=:1.3" | while read -r line; do
# 	info
# done
