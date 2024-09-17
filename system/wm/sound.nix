{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
   ];

  # Pipewire.
  # sound.enable = false;
  # sound.mediaKeys.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.blueman.enable = true;
}
