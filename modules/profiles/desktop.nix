{ pkgs, lib, ... }: {
  imports = [
    ../programs/aerospace
    ../programs/wezterm
  ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    signal-desktop
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    (pkgs.writeShellScriptBin "firefox" ''
      exec "$HOME/Applications/Home Manager Apps/Firefox.app/Contents/MacOS/firefox" "$@"
    '')
  ];
}
