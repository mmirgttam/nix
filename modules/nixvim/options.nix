{
  opts = {
    shell = "zsh";
    mouse = "";
    updatetime = 1000;

    number = true;
    relativenumber = true;
    signcolumn = "yes";
    numberwidth = 5;
    cursorline = true;

    foldmethod = "syntax";
    foldlevelstart = 99;

    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    autoindent = true;

    showcmd = false;
    list = true;
    wrap = true;
    linebreak = true;

    splitright = true;
    splitbelow = true;

    hlsearch = true;
    ignorecase = true;
    incsearch = true;
    smartcase = true;
  };

  extraConfigLua = ''
    vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
    vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "popup" }
    vim.opt.listchars = { tab = "» ", nbsp = "␣", trail = "•", extends = "⟩", precedes = "⟨" }

    -- Native OSC52 clipboard provider. This replaces ojroques/nvim-osc52,
    -- which is obsolete with Neovim 0.10+.
    local function paste()
      return { vim.fn.split(vim.fn.getreg(""), "\n", true), vim.fn.getregtype("") }
    end

    vim.g.clipboard = {
      name = "osc52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
    }

    vim.diagnostic.config({
      virtual_text = true,
    })
  '';
}
