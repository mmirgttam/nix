{ ... }: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "auto";
    icons = "auto";
  };

  xdg.configFile."eza/theme.yml".source = ./eza.yml;
}
