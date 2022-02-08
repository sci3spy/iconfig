#!/bin/sh

# System autostart

# Sound Service
pipewire &
pipewire-pulse &

# Keybindings
pgrep -x sxhkd > /dev/null || sxhkd &

# Bind capslock as escape
exec setxkbmap -option caps:escape &

# Switch keyboard layout us, ara with alt_space
exec setxkbmap -layout us,ara -option grp:alt_space_toggle &

# Fix cursor [bspwm]
xsetroot -cursor_name left_ptr &

# Set the wallpaper
exec xwallpaper --stretch images/wallpaper.png
