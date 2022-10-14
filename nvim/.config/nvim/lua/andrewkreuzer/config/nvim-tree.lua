require('nvim-tree').setup({
  open_on_setup = true,
  open_on_setup_file = true,
  view = {
    adaptive_size = true,
  }
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
