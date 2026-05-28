{
  description = "dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:nix-community/nixGL";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, home-manager, nixgl, nixvim, ... }:
    let
      mkHome = { system, homeDirectory, modules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit nixgl; };
          modules = [
            nixvim.homeModules.nixvim
            ./home.nix
            { home.homeDirectory = homeDirectory; }
          ] ++ modules;
        };
    in {
      homeConfigurations = {
        "matt-aarch64-darwin" = mkHome {
          system = "aarch64-darwin";
          homeDirectory = "/Users/matt";
          modules = [ ./systems/aarch64-darwin.nix ];
        };

        "matt-x86_64-linux" = mkHome {
          system = "x86_64-linux";
          homeDirectory = "/home/matt";
          modules = [ ./systems/x86_64-linux.nix ];
        };
      };
    };
}
