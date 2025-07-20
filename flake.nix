{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:LunaCOLON3/zen-browser-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zen-browser, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # nixos - system hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        zen-browser.nixosModules.zen-browser
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations.alexeev = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        zen-browser.homeManagerModules.zen-browser
        ./home-manager/home.nix
      ];
    };
  };
}
