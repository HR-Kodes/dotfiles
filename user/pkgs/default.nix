{ pkgs, ... }:

{
    imports = [
    ./neovim
    ./mako/mako.nix
    ./mpd/mpd.nix
    ./fastfetch
    # ./dunst
    ];

  home.packages = with pkgs; [
  dunst
  ];
    home.file = {

        ".config/dunst/dunstrc".source = ./dunst/dunstrc;
    };

  }
