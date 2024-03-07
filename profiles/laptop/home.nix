{ pkgs, config, lib, ... }:

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
    foot insomnia
    libnotify htop unzip xarchiver swww
    grim slurp swappy viewnior
    mpv wl-clipboard wf-recorder cliphist
    brightnessctl
    youtube-music qbittorrent
    gimp brave

    (import ../../user/bin/wallsetter.nix { inherit pkgs; })
   ];


  home.file = {
    ".config/hypr/hyprland.conf".source = ../../user/wm/hyprland/hyprland.conf;
    ".config/waybar" = {
      source = ../../user/wm/waybar/dracula;
      recursive = true;
    };
    ".config/foot/foot.ini".source = ../../user/apps/foot/foot.ini;
    "Pictures/Wallpapers" = {
      source = ../../user/theme/wallpaper;
      recursive = true;
    };
    ".wlogout-icons" = {
       source = ../../user/wm/wlogout/icons;
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
