{
  description = "Nix Os Custom Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

  let
    lib = nixpkgs.lib;

    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "nixos"; # hostname
      profile = "laptop"; # select a profile defined from my profiles directory
      timezone = "Asia/Kolkata"; # select timezone
      locale = "en_IN"; # select locale
      allowUnfreePkgs = "1";
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "koushikhr"; # username
      name = "Koushik H R"; # name/identifier
      email = "koushikhr1441@gmail.com"; # email (used for certain configurations)
      dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
      theme = "manhattan-gtk-theme"; # selcted theme from my themes directory (./themes/)
      wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      # window manager type (hyprland or x11) translator
      wmType = if (wm == "hyprland") then "wayland" else "x11";
      term = "foot"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      fontPkg = pkgs.intel-one-mono; # Font package
    };
    
    pkgs = import nixpkgs {
      system =  systemSettings.system;
      config = {
        allowUnfree = true;
      };
    };

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/configuration.nix") ];
        specialArgs = {
          # Pass config variables from above to make this modular.
          inherit systemSettings;
          inherit userSettings;
         };
       };
     };

    homeConfigurations = {
      koushikhr = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/home.nix") ];
        extraSpecialArgs = {
          # Pass config variables from above to make this modular.
          inherit systemSettings;
          inherit userSettings;
         };
       };
     };
   };
}
