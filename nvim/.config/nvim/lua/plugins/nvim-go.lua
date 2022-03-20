vim.api.nvim_set_keymap('n', '<leader>gt', ':GoTest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gtf', ':GoTestFunc<CR>', { noremap = true, silent = true })

vim.cmd([[
  augroup NvimGo
  autocmd!
  autocmd User NvimGoLintPopupPost wincmd p
  augroup END
]])
