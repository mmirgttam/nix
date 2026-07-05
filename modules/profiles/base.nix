{ pkgs, ... }: {
  imports = [
    ../programs/direnv.nix
    ../programs/eza
    ../programs/fzf.nix
    ../programs/git.nix
    ../programs/htop.nix
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
    dig
    fd
    delta
    hexdump
    hexyl
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
