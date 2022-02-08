#!/bin/sh

# List the options
choice=$(echo "Shutdown\nReboot\nHibernate\nSuspend\nExit" | dmenu -i -p "Choose action: ")

# Excution
[ $choice = "Shutdown" ] && doas poweroff
[ $choice = "Reboot" ] && doas reboot
[ $choice = "Hibernate" ] && doas ZZZ
[ $choice = "Suspend" ] && doas zzz
[ $choice = "Exit" ] && pkill bspwm
