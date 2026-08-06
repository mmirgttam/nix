{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python313.withPackages (ps: [
      ps.python-lsp-server
    ]))
    uv
  ];

  programs.nixvim.plugins.lsp.servers = {
    pylsp = {
      enable = true;
      settings.plugins = {
        pycodestyle.enabled = false;
        pyflakes.enabled = false;
        yapf.enabled = false;
      };
    };

    ruff.enable = true;
  };
}
