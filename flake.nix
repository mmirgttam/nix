{
  description = "dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:nix-community/nixGL";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    workmux.url = "github:raine/workmux";
  };

  outputs = { self, nixpkgs, home-manager, nixgl, nixvim, workmux, ... }:
    let
      homeModules = {
        profiles = {
          base = ./modules/profiles/base.nix;
          desktop = ./modules/profiles/desktop.nix;
          base-dev = ./modules/profiles/base-dev.nix;
          python-dev = ./modules/profiles/python-dev.nix;
        };

        platforms = {
          aarch64-darwin = ./modules/platforms/aarch64-darwin.nix;
          x86_64-linux = ./modules/platforms/x86_64-linux.nix;
        };
      };

      mkHome = { system, homeDirectory, modules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit nixgl workmux; };
          modules = [
            nixvim.homeModules.nixvim
            ./home.nix
            { home.homeDirectory = homeDirectory; }
          ] ++ modules;
        };
    in {
      lib.mkHome = mkHome;
      inherit homeModules;

      homeConfigurations = {
        "matt-aarch64-darwin" = mkHome {
          system = "aarch64-darwin";
          homeDirectory = "/Users/matt";
          modules = [
            homeModules.platforms.aarch64-darwin
            homeModules.profiles.base
            homeModules.profiles.desktop
            homeModules.profiles.base-dev
            homeModules.profiles.python-dev
          ];
        };

        "matt-x86_64-linux" = mkHome {
          system = "x86_64-linux";
          homeDirectory = "/home/matt";
          modules = [
            homeModules.platforms.x86_64-linux
            homeModules.profiles.base
            homeModules.profiles.desktop
            homeModules.profiles.base-dev
            homeModules.profiles.python-dev
          ];
        };
      };

      checks = {
        aarch64-darwin."matt-aarch64-darwin" =
          self.homeConfigurations."matt-aarch64-darwin".activationPackage;

        x86_64-linux."matt-x86_64-linux" =
          self.homeConfigurations."matt-x86_64-linux".activationPackage;
      };
    };
}
