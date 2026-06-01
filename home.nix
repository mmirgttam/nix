{ lib, ... }: {
  options.matt.home-manager = {
    switchFlake = lib.mkOption {
      type = lib.types.str;
      default = "~/.config/home-manager";
      description = "Flake path used by the hms alias.";
    };

    switchConfiguration = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Home Manager configuration name used by the hms alias.";
    };
  };

  config = {
    home.username = "matt";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;
  };
}
