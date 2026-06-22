{ lib, pkgs, ... }: {
  imports = [
    ../programs/nodejs.nix
  ];

  home.packages = with pkgs; [
    bintools
    cmake
    gh
    glow
    lefthook
    ninja
    tree-sitter
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (with pkgs; [
    heaptrack
    hotspot
    strace
    valgrind
  ]);
}
