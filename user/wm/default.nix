{ pkgs, ... }:

{
    imports = [
    ./wofi/wofi.nix
    ./wlogout/wlogout.nix
    ./wlogout/swaylock.nix
    ];
  }
