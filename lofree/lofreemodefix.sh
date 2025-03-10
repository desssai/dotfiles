#!/bin/env bash

echo "Fixing Lofree Fn Mode"
echo
echo "Please swtich keyboard into the MacOS/iOS mode: Press Fn + M"
echo 
read -p "Press any key to continue... " PRESSKEY
echo
echo "Setting Lofree Fn Mode to 2"
sudo sh -c 'echo 2 > /sys/module/hid_apple/parameters/fnmode'
echo "Done!"
echo
echo "You can set keyboard back to Windows/Android mode by pressing Fn + N"
