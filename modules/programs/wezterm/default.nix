{ ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };

  home.file.".wezterm.lua".source = ./wezterm.lua;
}
