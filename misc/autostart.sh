#!/bin/sh

# Sound Service
pipewire &
pipewire-pulse &

# Keybindings
pgrep -x sxhkd > /dev/null || sxhkd &

# Switch keyboard layout us, ara with alt_space and Bind capslock as escape
exec setxkbmap -layout us,ara -option grp:alt_space_toggle -option caps:escape &

# Fix cursor [bspwm]
xsetroot -cursor_name left_ptr &

# Set the wallpaper
xwallpaper --stretch images/wallpaper.png
