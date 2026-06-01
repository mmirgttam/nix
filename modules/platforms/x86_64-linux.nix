{ config, lib, nixgl, pkgs, ... }: {
  targets.genericLinux.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;

  programs.firefox.package = config.lib.nixGL.wrap pkgs.firefox;
  programs.wezterm.package = config.lib.nixGL.wrap pkgs.wezterm;

  matt.home-manager = {
    switchFlake = lib.mkDefault "~/.config/home-manager";
    switchConfiguration = lib.mkDefault "matt-x86_64-linux";
  };
}
