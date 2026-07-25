{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python313.withPackages (ps: [
      ps.python-lsp-ruff
      ps.python-lsp-server
    ]))
    uv
  ];

  programs.nixvim.plugins.lsp.servers.pylsp = {
    enable = true;
    settings.plugins = {
      ruff.enabled = true;
      pycodestyle.enabled = false;
      pyflakes.enabled = false;
      yapf.enabled = false;
    };
  };
}
