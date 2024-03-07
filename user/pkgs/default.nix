{ pkgs, ... }:

{
    imports = [
    ./neovim
    ./mako/mako.nix
    ./mpd/mpd.nix
    # ./dunst
    ];
  }
