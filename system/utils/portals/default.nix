{ config, pkgs, lib, ... }:

{
  # Portals.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
     ];
   };
}