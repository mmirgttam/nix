{ lib, pkgs, workmux, ... }: {
  imports = [
    ../programs/nodejs.nix
    ../programs/pi.nix
  ];

  programs.zsh.shellAliases.wmrm = "workmux remove";

  home.packages = with pkgs; [
    agent-browser
    bintools
    cmake
    direnv
    gh
    glow
    gnupg
    lefthook
    ninja
    tree-sitter
    wireshark
    wireshark-cli
    workmux.packages.${pkgs.stdenv.hostPlatform.system}.default
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin (with pkgs; [
    terminal-notifier
  ]) ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (with pkgs; [
    heaptrack
    hotspot
    strace
    valgrind
  ]);
}
