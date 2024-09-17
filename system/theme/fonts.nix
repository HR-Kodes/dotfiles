{ pkgs, config, lib, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
   ];
}
