{ pkgs, username,... }:

{
    imports = [
    # ./wofi/wofi.nix
    ./rofi
    ./wlogout/wlogout.nix
    ./wlogout/swaylock.nix
    ];

    home.file = {
        ".config/wlogout" = {
            source = ./wlogout2;
            recursive = true;
        };

        ".config/eww" = {
            source = ../pkgs/eww;
            recursive = true;
        };
    };

  }
