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
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
       };
     };

    # ----- USER SETTINGS ----- #
    wm = "hyprland";
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/laptop/configuration.nix ];
        specialArgs = {
          # Pass config variables from above to make this modular.
	  inherit wm;
         };
       };
     };

    homeConfigurations = {
      koushikhr = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/laptop/home.nix ];
        extraSpecialArgs = {
          # Pass config variables from above to make this modular.
          inherit wm;
         };
       };
     };
   };
}
