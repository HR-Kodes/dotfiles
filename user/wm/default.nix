{ pkgs, username,... }:

{
    imports = [
    # ./wofi/wofi.nix
    ./rofi
    ];

    home.file = {

        ".config/eww" = {
            source = ../pkgs/eww;
            recursive = true;
        };
    };

  }
