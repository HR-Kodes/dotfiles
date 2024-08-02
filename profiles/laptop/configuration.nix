# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib , systemSettings, userSettings, inputs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../system/theme/fonts.nix
    ../../system/pkgs
    ../../system/apps
    ../../system/utils
    (./. + "../../../system/wm" + ("/" + userSettings.wm) + ".nix")
  ];

  # Flakes.
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';


  networking.hostName = systemSettings.hostname; # Hostname.

  # Time zone.
  time.timeZone = systemSettings.timezone;


  # Keymap in X11.
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };


  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = systemSettings.allowUnfreePkgs;
    XDG_CURRENT_DESKTOP = if (userSettings.wm == "hyprland") then "Hyprland" else "x11";
    XDG_SESSION_TYPE = userSettings.wmType;
    XDG_SESSION_DESKTOP = if (userSettings.wm == "hyprland") then "Hyprland" else "x11";
    GDK_BACKEND = userSettings.wmType;
    CLUTTER_BACKEND = userSettings.wmType;
    NIXPKGS_ALLOW_INSECURE = "1";
   };

  # Defining user account. Set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages installed in system profile.
  environment.systemPackages = with pkgs; [
    fastfetch wget mako lsof git
  ];



  security.pam.services.swaylock = {
    text = ''
      auth include login
     '';
   };

  programs.kdeconnect.enable = true;

  environment.etc = {
    "xdg/gtk-2.0/gtkrc".text = "gtk-application-prefer-dark-theme=true";
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=true
    '';
    "xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=true
    '';
};


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
