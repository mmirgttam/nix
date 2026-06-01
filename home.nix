{ lib, ... }: {
  options.matt.home-manager = {
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
