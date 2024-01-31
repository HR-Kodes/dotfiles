{ config, pkgs, lib, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
    show = "run";
     };
   };
}
