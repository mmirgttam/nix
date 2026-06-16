{
  globals.loaded_netrwPlugin = 1;

  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true;

      integrations = {
        grep_in_directory = "fzf-lua";
        grep_in_selected_files = "fzf-lua";
      };
    };
  };
}
