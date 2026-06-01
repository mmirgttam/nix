{
  autoGroups.config_autocmds = {
    clear = true;
  };

  autoCmd = [
    {
      event = "FileType";
      group = "config_autocmds";
      pattern = "*";
      callback.__raw = ''
        function()
          vim.opt_local.formatoptions:remove({ "o" })
        end
      '';
      desc = "Don't continue comments on new lines";
    }
    {
      event = [
        "BufEnter"
        "FileType"
      ];
      group = "config_autocmds";
      callback.__raw = ''
        function()
          vim.opt_local.colorcolumn = vim.b.colorcolumn or ""
        end
      '';
      desc = "Reapply buffer-defined colorcolumn";
    }
  ];
}
