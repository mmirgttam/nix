{ ... }: {
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      git.pagers = [
        {
          colorArg = "always";
          pager = "delta --paging=never --syntax-theme='Catppuccin Frappe' --line-numbers --hunk-header-decoration-style=none --file-style='bold yellow'";
        }
      ];
    };
  };
}
