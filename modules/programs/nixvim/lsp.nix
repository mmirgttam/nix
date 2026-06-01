{ ... }: {
  plugins.lsp = {
    enable = true;

    onAttach = ''
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    '';

    keymaps.extra = [
      {
        key = "gD";
        action.__raw = "vim.lsp.buf.declaration";
      }
      {
        key = "gd";
        action.__raw = "vim.lsp.buf.definition";
      }
      {
        key = "K";
        action.__raw = "vim.lsp.buf.hover";
      }
      {
        key = "<leader>D";
        action.__raw = "vim.lsp.buf.type_definition";
      }
      {
        key = "<leader>cn";
        action.__raw = "vim.lsp.buf.rename";
      }
      {
        key = "<leader>ca";
        action.__raw = "vim.lsp.buf.code_action";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "<leader>cr";
        action.__raw = "vim.lsp.buf.references";
      }
      {
        key = "<leader>cf";
        action.__raw = "vim.lsp.buf.format";
      }
    ];
  };
}
