{ pkgs, ... }:

{
    imports = [
        ./grub
        ./locale
        ./portals
        ./networking
    ];
}