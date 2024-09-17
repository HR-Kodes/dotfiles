{pkgs, ...}: {
  imports = [
    ./neovim
    ./helix
    ./starship
    ./sh.nix
  ];
}
