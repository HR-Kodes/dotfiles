{
  pkgs,
  config,
  lib,
  username,
  ...
}: {
  programs.home-manager.enable = true;
  home.username = "koushikhr";
  home.homeDirectory = "/home/koushikhr";
  home.stateVersion = "23.11";

  imports = [
    # ../../user/theme
    ../../user/apps
    ../../user/pkgs
    ../../user/cosmic
  ];

  home.packages = with pkgs; [
    # Add home packages to install for user.
    insomnia
    brave
    htop
    unzip
    xarchiver
    wl-clipboard
    wf-recorder
    ffmpeg
    youtube-music
    qbittorrent
    qutebrowser
    vlc
    telegram-desktop
    discord
    viewnior
  ];

  home.file = {
    "Documents/programming/.envrc".source = ../../user/dev/direnv/dotenvrc;
  };

  # programs.git = {
  #   enable = true;
  #   userName = "Koushik H R";
  #   userEmail = "koushikhr1441@gmail.com";
  # };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
