{ pkgs, home-manager, ... }:

{
  imports = [
    ./shell.nix
    ./bluetooth.nix
  ];
}
