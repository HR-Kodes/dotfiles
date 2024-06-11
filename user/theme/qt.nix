{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    # platformTheme.name = "gtk3";
    # platformTheme = "gtk3";
    platformTheme.name = "gtk3";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
     };
   };
}
