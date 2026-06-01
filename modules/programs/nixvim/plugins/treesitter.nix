{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "c"
          "cpp"
          "python"
          "lua"
          "vim"
          "vimdoc"
          "query"
        ];
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "a," = "@parameter.outer";
            "i," = "@parameter.inner";
            "al" = "@loop.outer";
            "il" = "@loop.inner";
            "ab" = "@block.outer";
            "ib" = "@block.inner";
          };
        };
        move = {
          enable = true;
          set_jumps = true;
          goto_next_start = {
            "]f" = "@function.outer";
            "]c" = "@class.outer";
          };
          goto_previous_start = {
            "[f" = "@function.outer";
            "[c" = "@class.outer";
          };
          goto_next_end = {
            "]F" = "@function.outer";
            "]C" = "@class.outer";
          };
          goto_previous_end = {
            "[F" = "@function.outer";
            "[C" = "@class.outer";
          };
        };
        swap = {
          enable = true;
          swap_next."]a" = "@parameter.inner";
          swap_previous."[a" = "@parameter.inner";
        };
      };
    };
  };
}
