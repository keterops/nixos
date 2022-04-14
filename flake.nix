{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { home-manager, nixpkgs, ... }:
    let system = "x86_64-linux";

    in {
      nixosConfigurations.rev9 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nix/configuration.nix
          ./nix/hardware-configuration.nix
          { nix.registry.nixpkgs.flake = nixpkgs; }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.keter = import ./hm/hm.nix;
            };
          }
        ];
      };
    };
}
