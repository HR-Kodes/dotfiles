{ pkgs, config, lib, ... }:

{
  imports = [
    ./dbus.nix
    ./sound.nix
   ];

  environment.systemPackages = with pkgs; [
    sddm hyprland xwayland waybar
    libsForQt5.qt5.qtquickcontrols2 libsForQt5.qt5.qtgraphicaleffects
   ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
     };
    # waybar.enable = true;
   };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";
  services.displayManager.sddm.theme = "${import ../theme/sddm-theme.nix { inherit pkgs; }}";
}
