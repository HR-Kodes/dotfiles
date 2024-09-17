#{ pkgs }:
#
#pkgs.writeShellScriptBin "wallsetter" ''
#    NEWWALLPAPER=$(find ~/Pictures/Wallpapers -type l | shuf -n 1)
#
#    ${pkgs.swww}/bin/swww img $NEWWALLPAPER --transition-type wave --transition-angle 120 --transition-step 30
#''

{ pkgs, ... }:

pkgs.writeShellScriptBin "wallsetter" ''
  WALLPAPER=$(find /home/koushikhr/Pictures/Wallpapers -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
  PREVIOUS=$WALLPAPER
  if [ "$WALLPAPER" == "$PREVIOUS" ]; then
      WALLPAPER=$(find /home/koushikhr/Pictures/Wallpapers -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
  fi
  if [ -d /home/koushikhr/Pictures/Wallpapers ]; then
    num_files=$(ls -1 /home/koushikhr/Pictures/Wallpapers | wc -l)

    if [ $num_files -lt 1 ]; then
      notify-send -t 9000 "The wallpaper folder is expected to have more than 1 image. Exiting Wallsetter."
      exit
    fi

    ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type random
    
    square="$HOME/.cache/square_wallpaper.png"
    blurred="$HOME/.cache/blurred_wallpaper.png"
    blurred2="$HOME/.config/eww/dashboard-2/images/blurred_wallpaper.png"
    blur="50x30"
    used_wallpaper="$WALLPAPER"

    magick $used_wallpaper -resize 75% $blurred
    magick $blurred -blur $blur $blurred
    cp ~/.cache/blurred_wallpaper.png ~/.config/eww/dashboard-2/images/blurred_wallpaper.png

    magick $WALLPAPER -gravity Center -extent 1:1 $square
  fi
''

