{ pkgs, ... }: {
  home.username = "matt";
  home.stateVersion = "26.05";

  imports = [
    ./modules/direnv.nix
    ./modules/eza
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/lazygit.nix
    ./modules/starship.nix
    ./modules/wezterm
    ./modules/zoxide.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    bazelisk
    bintools
    btop
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
    tokei
    yazi
  ];

  programs.home-manager.enable = true;
}
