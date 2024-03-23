#!/bin/sh

i=$1
j=$2

if [ $i -lt $j ]; then
  while [ $i -le $j ]; do
    eww update $5=$i
    sleep $4
    i=$(($i + $3))
  done
else
  while [ $i -ge $j ]; do
    eww update $5=$i
    sleep $4
    i=$(($i - $3))
  done
fi
