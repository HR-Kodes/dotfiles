# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib , wm, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     (./. + "../../../system/wm" + ("/" + wm) + ".nix") # Selected Window Manager.
     ../../system/theme/fonts.nix
     # ../../system/apps/mpd/mpd.nix
    ];

  # Flakes.
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.blueman.enable = true;
  hardware.pulseaudio.configFile = pkgs.writeText "default.pa" ''
  load-module module-bluetooth-policy
  load-module module-bluetooth-discover
  ## module fails to load with 
  ##   module-bluez5-device.c: Failed to get device path from module arguments
  ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  # load-module module-bluez5-device
  # load-module module-bluez5-discover
'';
systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
};

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
     ];
   };

  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
   };

  # FISH -> Setting default shell to fish.
  environment.shells = with pkgs; [ bash fish zsh ];
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    # initExtra = ''
    #   ${pkgs.neofetch}/bin/neofetch
    #  '';
   };
  programs.zsh.interactiveShellInit = ''eval "$(direnv hook zsh"'';
  programs.fish.interactiveShellInit = ''
    set fish_greeting # Disable greeting
    ${pkgs.neofetch}/bin/neofetch
    eval "$(direnv hook fish)"
   '';

  programs.starship.enable = true;
  # programs.starship.settings = pkgs.lib.importTOML ../../user/shell/starship/starship.toml;
  # programs.starship.settings = pkgs.lib.importTOML ../../user/shell/starship/starship-2.toml;
  programs.starship.settings = pkgs.lib.importTOML ../../user/shell/starship/starship-3.toml;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.koushikhr = {
    isNormalUser = true;
    description = "Koushik H R";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget neofetch mako
    # mpd
  ];

  programs.thunar.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  security.pam.services.swaylock = {
    text = ''
      auth include login
     '';
   };

  # programs.nm-applet.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
