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
   ];

  home.packages = with pkgs; [
    # Add home packages to install for user.
    foot vivaldi unzip 
   ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../user/wm/hyprland.conf;
    ".config/waybar/config".source = ../../user/wm/waybar.config;
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
}
