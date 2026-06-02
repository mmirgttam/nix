{ pkgs, ... }: {
  imports = [
    ../programs/direnv.nix
    ../programs/eza
    ../programs/fzf.nix
    ../programs/git.nix
    ../programs/lazygit.nix
    ../programs/nixvim
    ../programs/starship.nix
    ../programs/zoxide.nix
    ../programs/zsh
  ];

  home.packages = with pkgs; [
    bat
    btop
    coreutils-prefixed
    fd
    hexdump
    hexyl
    htop
    hyperfine
    jq
    lsof
    lua-language-server
    ncdu
    nerd-fonts.fira-code
    procs
    ripgrep
    stylua
    tokei
    yazi
  ];
}
