{ config, pkgs, lib, ... }:

{
    services.dunst = {
        enable = true;
        package = pkgs.dunst;
        configFile = ./dunstrc;

        # settings.global.icon_path = ;

        # iconTheme.name = ;
        # iconTheme.package = ;
        # iconTheme.size = ;
      };
  }
