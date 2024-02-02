{ pkgs, config, lib, ... }:

{
  programs.home-manager.enable = true;
  home.username = "koushikhr";
  home.homeDirectory = "/home/koushikhr";
  home.stateVersion = "23.11";

  imports = [
    ../../user/wm/wofi/wofi.nix
    ../../user/theme/gtk.nix
    ../../user/theme/qt.nix
    ../../user/wm/wlogout/wlogout.nix
    ../../user/wm/wlogout/swaylock.nix
    ../../user/pkgs/mako/mako.nix
    # ../../user/shell/starship.nix
   ];

  home.packages = with pkgs; [
    # Add home packages to install for user.
    foot htop vivaldi unzip swww
    clipman libnotify
    grim slurp swappy viewnior
    mpv wl-clipboard wf-recorder
    brightnessctl

    (import ../../user/bin/wallsetter.nix { inherit pkgs; })
   ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../user/wm/hyprland.conf;
    ".config/waybar" = {
      source = ../../user/wm/waybar;
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
   };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
   };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
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

}
