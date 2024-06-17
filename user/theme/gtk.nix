{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    dconf
  ];

  # dconf = {
  #   enable = true;
  #   settings = {
  #     "org/gnome/desktop/interface" = {
  #       color-scheme = "prefer-dark";
  #     };
  #  };
  # };
    
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
      };

  gtk = {
    enable = true;
    font = {
      # name = "JetbrainsMono";
      # name = "Devicons";
      # name = "FontAwesome";
      name = "Iosevka";
      size = 10.5;
      package = pkgs.nerdfonts;
     };

    theme = {
      #name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      #package = pkgs.catppuccin-gtk.override {
      #  accents = [ "lavender" ];
      #  size = "compact";
      #  # tweaks = [ "rimless" ];
      #  variant = "mocha";
      # };

      name = "Everforest-Dark-B";
      package = pkgs.callPackage ../../packages/gtk/everforest-gtk-theme.nix { };

      # name = "papirus-icon-theme";
      # package = pkgs.papirus-icon-theme;
      
      # name = "Colorful-Dark-GTK";
      # package = pkgs.callPackage ../../packages/gtk/colorful-plasma-gtk-theme.nix { };
      
      # name = "Manhattan-Soft";
      # package = pkgs.callPackage ../../packages/icons/manhattan-gtk-theme.nix { };
     };

    iconTheme = {
      # name = "BeautyLine";
      # package = pkgs.beauty-line-icon-theme;

      # name = "Gruvbox Plus Dark";
      # package = pkgs.callPackage ../../packages/icons/gruvbox-plus-dark.nix { };

      # name = "Everforest-Dark";
      # package = pkgs.callPackage ../../packages/gtk/everforest-gtk-theme.nix { };

      name = "Colorful-Dark-Icons";
      package = pkgs.callPackage ../../packages/gtk/colorful-plasma-gtk-theme.nix { };
      
      # name = "Lüv";
      # package = pkgs.callPackage ../../packages/icons/luv-icon-theme.nix { };
      
     };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      
      # name = "Qogir-cursors";
      # package = pkgs.qogir-icon-theme;
    };


    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
       '';
     };
    gtk4.extraConfig = {
      Settings = ''
      gtk-application-prefer-dark-theme=1
     '';
     };

   };

  fonts.fontconfig.enable = true;
}
