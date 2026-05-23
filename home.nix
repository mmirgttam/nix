{ pkgs, ... }: {
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
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    bazelisk
    bintools
    fd
    gh
    git
    hexdump
    htop
    hyperfine
    jq
    nerd-fonts.fira-code
    python315
    ripgrep
    strace
    valgrind
    yazi
  ];

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
