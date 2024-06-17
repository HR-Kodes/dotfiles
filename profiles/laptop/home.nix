{ pkgs, config, lib, username, ... }:

{
  programs.home-manager.enable = true;
  home.username = "koushikhr";
  home.homeDirectory = "/home/koushikhr";
  home.stateVersion = "23.11";


  imports = [
    ../../user/wm
    ../../user/theme
    ../../user/apps
    ../../user/pkgs
   ];


  home.packages = with pkgs; [
    # Add home packages to install for user.
    foot insomnia brave stremio gimp
    libnotify htop unzip xarchiver swww lz4
    grim slurp swappy viewnior
    mpv wl-clipboard wf-recorder cliphist
    brightnessctl ffmpeg
    youtube-music qbittorrent vlc telegram-desktop
    discord

    eww python3 jq python312Packages.imaplib2

    hyprlock hyprpicker imagemagick

    # google-chrome protonvpn-gui networkmanagerapplet

    (import ../../user/bin/wallsetter.nix { inherit pkgs; })
   ];


  home.file = {
    ".config/hypr/hyprland.conf".source = ../../user/wm/hyprland/hyprland.conf;
    ".config/hypr/hyprlock.conf".source = ../../user/wm/hyprland/hyprlock.conf;

    ".config/waybar" = {
      source = ../../user/wm/waybar/dracula-2;
      recursive = true;
    };

    ".config/foot/foot.ini".source = ../../user/apps/foot/foot.ini;

    "Pictures/Wallpapers" = {
      source = ../../user/theme/wallpaper;
      recursive = true;
    };

    "Documents/programming/.envrc".source = ../../user/dev/direnv/dotenvrc;
   };


  programs.git = {
    enable = true;
    userName = "Koushik H R";
    userEmail = "koushikhr1441@gmail.com";
   };

  programs.waybar = {
    enable = true;
   };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
   };


  xdg.userDirs = {
    enable = true;
    createDirectories = true;
   };

}
