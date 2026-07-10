{ lib, pkgs, workmux, ... }: {
  imports = [
    ../programs/nodejs.nix
  ];

  home.packages = with pkgs; [
    agent-browser
    bintools
    cmake
    direnv
    gh
    glow
    lefthook
    ninja
    tree-sitter
    workmux.packages.${pkgs.system}.default
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (with pkgs; [
    heaptrack
    hotspot
    strace
    valgrind
  ]);
}
