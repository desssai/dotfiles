#!/bin/sh

if [ $(eww get $1) == "true" ]; then
  eww update $1=false
  sleep 0.1
  eww close $1
else
  eww update $1=true
  sleep 0.1
  eww open $1
fi
