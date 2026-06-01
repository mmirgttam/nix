{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python314.withPackages (ps: [
      ps.python-lsp-black
      ps.python-lsp-server
    ]))
    uv
  ];

  programs.nixvim.plugins.lsp.servers.pylsp = {
    enable = true;
    settings.plugins = {
      black.enabled = true;
      pycodestyle.enabled = false;
      pyflakes.enabled = true;
      yapf.enabled = false;
    };
  };
}
