{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font = {
      name = "JetbrainsMono";
      # size = 12;
      package = pkgs.nerdfonts;
     };
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "mocha";
       };
     };
    iconTheme = {
      # name = "Gruvbox Plus Dark";
      # package = pkgs.callPackage ../../packages/gruvbox-plus-dark.nix { };

      # name = "Everforest-Dark";
      # package = pkgs.callPackage ../../packages/everforest-gtk-theme.nix { };

      name = "Lüv";
      package = pkgs.callPackage ../../packages/luv-icon-theme.nix { };
      
     };
    # cursorTheme = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    #  };

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
}
