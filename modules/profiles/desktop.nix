{ pkgs, lib, ... }: {
  imports = [
    ../programs/aerospace
    ../programs/wezterm
  ];

  home.packages = with pkgs; [
    signal-desktop
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    gimp
  ];
}
