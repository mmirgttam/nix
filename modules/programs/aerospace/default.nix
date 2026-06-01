{ lib, pkgs, ... }: {
  programs.aerospace = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    enable = true;
    launchd.enable = true;
    settings = builtins.fromTOML (builtins.readFile ./aerospace.toml);
  };
}
