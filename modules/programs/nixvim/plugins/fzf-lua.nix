{
  plugins.fzf-lua = {
    enable = true;
    settings.defaults.actions."ctrl-x".__raw = ''require("fzf-lua.actions").file_split'';
  };
}
