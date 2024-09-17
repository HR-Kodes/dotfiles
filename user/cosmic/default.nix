{pkgs, ...}: {
  imports = [
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 16;
  };

  home.file = {
    ".config/cosmic/com.system76.CosmicPanel.Panel" = {
      source = ./panel;
      recursive = true;
    };
    ".config/cosmic/com.system76.CosmicPanel.Dock" = {
      source = ./dock;
      recursive = true;
    };
    ".config/cosmic/com.system76.CosmicTerm" = {
      source = ./term;
      recursive = true;
      # "Hurmit Nerd Font Mono"
      # "JetBrainsMono Nerd Font Mono"
    };
  };
}
