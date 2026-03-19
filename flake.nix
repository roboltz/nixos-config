{
  description = "NixOS configuration";

  inputs = {


    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-src.url = "github:niri-wm/niri?ref=wip/branch";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-src";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    
    hytale-launcher = {
      #hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
      url = "github:roboltz/hytale-launcher-nix/fix/icon";
    };


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, niri, home-manager, stylix, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	      ./hosts/nixos/configuration.nix
	      ./nixosModules
        # This nixos-hardware input imports packages compatible with the Dell G5 5590.
        # Remove this line if not using relavant hardware.
	      nixos-hardware.nixosModules.dell-xps-15-7590
        stylix.nixosModules.stylix
	      home-manager.nixosModules.home-manager
      ];
    };

    homeManagerModules.nixos = import ./homeManagerModules;

    # You can remove me
    nixosConfigurations.g5-5590 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	      ./hosts/g5-5590/configuration.nix
	      ./nixosModules
        niri.nixosModules.niri
	      nixos-hardware.nixosModules.dell-xps-15-7590
        stylix.nixosModules.stylix
	      home-manager.nixosModules.home-manager
      ];
    };
    
    homeManagerModules.g5-5590 = import ./homeManagerModules;
    
  };
}
