{ lib, pkgs, ... }: {
  imports = [
    ../programs/nodejs.nix
    ../programs/pi.nix
  ];

  home.packages = with pkgs; [
    bintools
    cmake
    direnv
    gh
    glow
    gnupg
    lefthook
    ninja
    tree-sitter
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin (with pkgs; [
    terminal-notifier
  ]) ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (with pkgs; [
    heaptrack
    hotspot
    strace
    valgrind
  ]);
}
