{ config, nixgl, pkgs, ... }: {
  targets.genericLinux.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;

  programs.firefox.package = config.lib.nixGL.wrap pkgs.firefox;
  programs.wezterm.package = config.lib.nixGL.wrap pkgs.wezterm;

  programs.zsh.shellAliases.hms = "home-manager switch --flake ~/.config/home-manager#matt-x86_64-linux";

  home.packages = with pkgs; [
    bintools
    heaptrack
    hotspot
    strace
    valgrind
  ];
}
