#!/bin/sh

if [ $(eww get $1) == "true" ]; then
  eww update $1=false
  sleep 0.05
  eww close $1
  eww close $1-color-burn
else
  eww update $1=true
  sleep 0.05
  eww open $1-color-burn
  eww open $1
fi
