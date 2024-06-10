#!/bin/sh

sleep 0.3
$HOME/.dotfiles/user/pkgs/eww/sidebar/launch.sh

if [[ "$1" == "reboot" ]]; then
	$HOME/.dotfiles/scripts/power.sh reboot
elif [[ "$1" == "shutdown" ]]; then
	$HOME/.dotfiles/scripts/power.sh shutdown
elif [[ "$1" == "lock" ]]; then
	$HOME/.dotfiles/scripts/power.sh lock
elif [[ "$1" == "suspend" ]]; then
	$HOME/.dotfiles/scripts/power.sh suspend
elif [[ "$1" == "logout" ]]; then
	$HOME/.dotfiles/scripts/power.sh exit
fi
