{
  plugins.persistence = {
    enable = true;
    settings = {
      dir.__raw = ''vim.fn.stdpath("state") .. "/sessions/"'';
      options = [ "buffers" "curdir" "tabpages" "winsize" ];
    };
  };
}
