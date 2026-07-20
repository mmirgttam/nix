{ lib, pkgs, workmux, ... }: {
  imports = [
    ../programs/nodejs.nix
  ];

  programs.zsh.shellAliases.wmrm = "workmux remove";

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
