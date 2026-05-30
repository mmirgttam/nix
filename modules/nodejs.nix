{ config, lib, pkgs, ... }:
let
  npmPrefix = "${config.home.homeDirectory}/.local/share/npm-global";
in {
  home.packages = with pkgs; [ nodejs_24 ];
  home.sessionVariables = { NPM_CONFIG_PREFIX = npmPrefix; };
  home.sessionPath = [ "${npmPrefix}/bin" ];
}
