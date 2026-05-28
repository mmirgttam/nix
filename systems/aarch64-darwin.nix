{ pkgs, ... }: {
  home.sessionVariables = {
    WEZTERM_SHELL_SKIP_USER_VARS = "1";
    WEZTERM_SHELL_SKIP_CWD = "1";
  };

  programs.zsh.shellAliases.hms = "home-manager switch --flake ~/.config/home-manager#matt-aarch64-darwin";

  home.packages = with pkgs; [
  ];
}
