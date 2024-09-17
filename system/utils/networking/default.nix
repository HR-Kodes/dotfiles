{ config, pkgs, lib, ... }:

{
  # Enabled networking.
  networking.networkmanager.enable = true;

  networking = {
    firewall.enable = true;
    firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764;} ]; # for Gsconnect
    firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764;} ]; # for Gsconnect
  };
}