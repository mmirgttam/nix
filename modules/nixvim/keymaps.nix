{ lib, ... }:
let
  map = mode: key: action: desc: {
    inherit mode key action;
    options.desc = desc;
  };

  n = map "n";
  v = map "v";
  t = map "t";
  nv = map [ "n" "v" ];
  lua = lib.nixvim.mkRaw;
in {
  keymaps = [
    # General
    (n "<leader>H" ":noh<cr>" "Clear highlights")

    # File paths
    (n "<leader>yf" ":let @+ = expand('%')<cr>" "Copy relative path to current file")
    (n "<leader>yF" ":let @+ = expand('%:p')<cr>" "Copy absolute path to current file")

    # Move lines
    (n "<A-j>" ":m .+1<cr>==" "Move line down")
    (n "<A-k>" ":m .-2<cr>==" "Move line up")
    (v "<A-j>" ":m '>+1<CR>gv=gv" "Move selection down")
    (v "<A-k>" ":m '<-2<CR>gv=gv" "Move selection up")

    # Window navigation
    (n "<C-h>" "<C-w>h" "Move to window left")
    (n "<C-j>" "<C-w>j" "Move to window below")
    (n "<C-k>" "<C-w>k" "Move to window above")
    (n "<C-l>" "<C-w>l" "Move to window right")

    # Tabs
    (n "<leader><tab>[" "<cmd>tabprevious<cr>" "Previous tab")
    (n "<leader><tab>]" "<cmd>tabnext<cr>" "Next tab")
    (n "<leader><tab><tab>" "<cmd>tabnew<cr>" "New tab")
    (n "<leader><tab>d" "<cmd>tabclose<cr>" "Close tab")

    # Terminal
    (t "<C-[>" ''<C-\><C-n>'' "Exit terminal mode")

    # Hop
    (n "<leader>h" "<cmd>HopWord<cr>" "Hop to word")

    # Fzf-lua
    (n "<leader><space>" (lua ''
      function()
        require("fzf-lua").files({ cwd = vim.loop.cwd() })
      end
    '') "Find files (cwd)")

    (n "<leader>ff" (lua ''
      function()
        local fzf = require("fzf-lua")
        local ok, git_root = pcall(fzf.path.git_root, { throw = false })
        fzf.files({ cwd = ok and git_root or vim.loop.cwd() })
      end
    '') "Find files (repo root or cwd)")

    (n "<leader>fb" (lua ''function() require("fzf-lua").buffers() end'') "Buffers")
    (n "<leader>," (lua ''function() require("fzf-lua").buffers() end'') "Buffers")
    (n "<leader>fr" (lua ''function() require("fzf-lua").oldfiles() end'') "Recent files")
    (n "<leader>fg" (lua ''function() require("fzf-lua").live_grep() end'') "Live grep")
    (n "<leader>fw" (lua ''function() require("fzf-lua").grep_cword() end'') "Grep word under cursor")
    (nv "<leader>fW" (lua ''function() require("fzf-lua").grep_visual() end'') "Grep visual selection")

    # Git
    (n "<leader>gf" (lua ''function() require("fzf-lua").git_files() end'') "Git files")
    (n "<leader>gb" (lua ''function() require("fzf-lua").git_branches() end'') "Git branches")
    (n "<leader>g/" (lua ''function() require("fzf-lua").git_grep() end'') "Git grep")
    (n "<leader>gC" (lua ''function() require("fzf-lua").git_commits() end'') "Git commits")
    (n "<leader>gc" (lua ''function() require("fzf-lua").git_bcommits() end'') "Git commits (buffer)")

    (n "<leader>ga" "<cmd>G blame<cr>" "Git blame")
    (n "<leader>gd" "<cmd>Gdiff origin/main<cr>" "Git diff")

    (n "<leader>gD" (lua ''
      function()
        local res = vim.api.nvim_exec2("G merge-base origin/main HEAD", { output = true })
        vim.cmd("DiffviewOpen " .. res.output)
      end
    '') "Git diff branch changes")

    # LazyGit
    (n "<leader>l" "<cmd>LazyGit<cr>" "Open LazyGit")
    (n "<leader>gh" "<cmd>LazyGitFilterCurrentFile<cr>" "Git history for current file")

    # Trouble
    (n "<leader>xx" "<cmd>Trouble diagnostics toggle<cr>" "Diagnostics (Trouble)")
    (n "<leader>xX" "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" "Buffer diagnostics (Trouble)")
    (n "<leader>xs" "<cmd>Trouble symbols toggle focus=false<cr>" "Symbols (Trouble)")
    (n "<leader>xl" "<cmd>Trouble loclist toggle<cr>" "Location list (Trouble)")
    (n "<leader>xq" "<cmd>Trouble qflist toggle<cr>" "Quickfix list (Trouble)")

    # Yazi
    (nv "<leader>z" "<cmd>Yazi<cr>" "Open Yazi file manager")

    (n "<leader>C" (lua ''
      function()
        require("yazi").yazi(nil, vim.fn.stdpath("config"))
      end
    '') "Open Neovim config")
  ];
}
