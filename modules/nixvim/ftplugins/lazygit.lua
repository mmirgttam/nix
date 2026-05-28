-- Map Esc to its normal behavior for lazygit.
vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<Esc>', {noremap = true, silent = true}) 
