{ pkgs, ... }: {
  globals.NERDDefaultAlign = "left";

  extraPlugins = with pkgs.vimPlugins; [
    nerdcommenter
  ];
}
