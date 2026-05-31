{ pkgs, ... }: {
  home.username = "matt";
  home.stateVersion = "26.05";

  imports = [
    ./modules/direnv.nix
    ./modules/eza
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/lazygit.nix
    ./modules/nixvim
    ./modules/nodejs.nix
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
    cmake
    fd
    gh
    git
    hexdump
    hexyl
    htop
    hyperfine
    jq
    lsof
    lua-language-server
    nerd-fonts.fira-code
    ninja
    procs
    python314
    python314Packages.python-lsp-server
    ripgrep
    stylua
    tokei
    tree-sitter
    yazi
  ];

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
}
