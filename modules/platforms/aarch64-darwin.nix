{ lib, ... }: {
  home.sessionVariables = {
    WEZTERM_SHELL_SKIP_USER_VARS = "1";
    WEZTERM_SHELL_SKIP_CWD = "1";
  };

  matt.home-manager.switchConfiguration = lib.mkDefault "matt-aarch64-darwin";
}
