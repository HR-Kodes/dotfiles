#!/bin/sh
FILE="$HOME/.cache/ml4w_sidebar"
CFG="$HOME/.dotfiles/user/pkgs/eww/sidebar"
EWW=$(which eww)

if [[ ! $(pidof eww) ]]; then
	${EWW} daemon
	sleep 0.5
fi

#if [ -f $HOME/.dotfiles/settings/eww-monitor.sh ] && [ $(cat $HOME/.dotfiles/settings/eww-monitor.sh) != "auto" ]; then
#	echo ":: Using monitor id from $HOME/.dotfiles/settings/eww-monitor.sh"
#	sc=$(cat $HOME/.dotfiles/settings/eww-monitor.sh)
#	echo $sc
#else
#	echo ":: Autodetect current focused monitor."
#	sc=$(python $HOME/.dotfiles/settings/active-monitor.py)
#	echo $sc
#fi
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	sc=0
	echo ":: Opening on Monitor $sc"
	${EWW} --config "$CFG" open ml4wlauncher --screen 0
	${EWW} --config "$CFG" open resources --screen 0
	${EWW} --config "$CFG" open logout --screen 0
	${EWW} --config "$CFG" open suspend --screen 0
	${EWW} --config "$CFG" open lock --screen 0
	${EWW} --config "$CFG" open reboot --screen 0
	${EWW} --config "$CFG" open shutdown --screen 0
	${EWW} --config "$CFG" open close --screen 0
else
	${EWW} --config "$CFG" close resources ml4wlauncher logout suspend lock reboot shutdown close
	echo ":: Closing widgets"
	rm "$FILE"
fi
