{
  plugins.lualine = {
    enable = true;
    settings = {
      sections = {
        lualine_b = [ "branch" "diff" ];
        lualine_c = [
          {
            "__unkeyed-1" = "filename";
            path = 1;
            symbols = {
              modified = " ";
              readonly = " ";
              unnamed = "󰡯 ";
              newfile = "󰝒 ";
            };
          }
        ];
        lualine_x = [
          {
            "__unkeyed-1" = "diagnostics";
            sources = [ "nvim_diagnostic" ];
            sections = [ "error" "warn" "info" "hint" ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰌵 ";
            };
          }
          "lsp_status"
          "filetype"
          "location"
          "selectioncount"
        ];
        lualine_z = [ ];
      };
    };
  };
}
