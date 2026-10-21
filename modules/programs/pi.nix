{ config, ... }: {
  home.sessionPath = [ "${config.home.homeDirectory}/.pi/agent/bin" ];
  home.sessionVariables = {
    PI_TELEMETRY = "0";
    POWERLINE_NERD_FONTS = "1";
  };
}
