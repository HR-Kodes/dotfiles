#!/bin/sh
if [[ "$1" == "--welcome" ]]; then
	$HOME/.dotfiles/settings/ml4w/ML4W_Welcome-x86_64.AppImage &
elif [[ "$1" == "--dotfiles" ]]; then
	$HOME/.dotfiles/settings/ml4w/ML4W_Dotfiles_Settings-x86_64.AppImage &
elif [[ "$1" == "--hyprland" ]]; then
	$HOME/.dotfiles/settings/ml4w/ML4W_Hyprland_Settings-x86_64.AppImage &
else
	echo "ERROR: $1 not found"
fi

$HOME/.dotfiles/user/pkgs/eww/sidebar/launch.sh &
