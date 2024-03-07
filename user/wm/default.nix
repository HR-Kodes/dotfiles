{ pkgs, ... }:

{
    imports = [
    # ./wofi/wofi.nix
    ./rofi
    ./wlogout/wlogout.nix
    ./wlogout/swaylock.nix
    ];
  }
