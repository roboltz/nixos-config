{
  description = "NixOS configuration";

  inputs = {


    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    niri-src.url = "github:niri-wm/niri?ref=wip/branch";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-src";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    #hytale-launcher = {
      #hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
      #url = "github:roboltz/hytale-launcher-nix/fix/icon";
    #};

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-flatpak, nixos-hardware, niri, home-manager, stylix, ... }: {

    nixosConfigurations.g5-5590 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	      ./hosts/g5-5590/configuration.nix
	      ./nixosModules
	      nixos-hardware.nixosModules.dell-xps-15-7590
        nix-flatpak.nixosModules.nix-flatpak
        niri.nixosModules.niri
        stylix.nixosModules.stylix
	      home-manager.nixosModules.home-manager
      ];
    };
    
    homeManagerModules.g5-5590 = import ./homeManagerModules;
    
  };
}
