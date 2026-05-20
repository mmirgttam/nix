{ pkgs, ... }: {
  home.username = "matt";
  home.homeDirectory = "/home/matt";
  home.stateVersion = "26.05";

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/starship.nix
    ./modules/wezterm.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    bazelisk
    fd
    gh
    git
    htop
    lazygit
    nerd-fonts.fira-code
    python3
    ripgrep
    yazi
  ];

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
