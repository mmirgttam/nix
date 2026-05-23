{ nixgl, pkgs, ... }: {
  home.username = "matt";
  home.homeDirectory = "/home/matt";
  home.stateVersion = "26.05";

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/lazygit.nix
    ./modules/starship.nix
    ./modules/wezterm.nix
    ./modules/zoxide.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    bazelisk
    bintools
    btop
    eza
    fd
    gh
    hexdump
    hexyl
    htop
    hyperfine
    jq
    lsof
    nerd-fonts.fira-code
    procs
    python315
    ripgrep
    strace
    tokei
    valgrind
    yazi
  ];

  targets.genericLinux.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;
  programs.home-manager.enable = true;
}
