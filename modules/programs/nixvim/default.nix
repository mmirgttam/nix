{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    nixpkgs.source = pkgs.path;

    imports = [
      ./autocmds.nix
      ./filetypes.nix
      ./ftplugins.nix
      ./keymaps.nix
      ./lsp.nix
      ./options.nix
      ./syntax.nix

      ./plugins/catppuccin.nix
      ./plugins/fzf-lua.nix
      ./plugins/lualine.nix
      ./plugins/nerdcommenter.nix
      ./plugins/persistence.nix
      ./plugins/render-markdown.nix
      ./plugins/snacks.nix
      ./plugins/treesitter.nix
      ./plugins/yazi.nix
    ];

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {
      diffview.enable = true;
      fugitive.enable = true;
      gitsigns.enable = true;
      hop.enable = true;
      lazygit.enable = true;
      trouble.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
    };
  };
}
