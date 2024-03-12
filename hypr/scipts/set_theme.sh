#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light-solid'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-light'
gsettings set org.gnome.desktop.interface cursor-theme 'WhiteSur-cursors'
hyprctl setcursor WhiteSur-cursors 24
