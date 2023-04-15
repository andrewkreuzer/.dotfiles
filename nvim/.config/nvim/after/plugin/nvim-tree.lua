require('nvim-tree').setup({
  view = {
    adaptive_size = true,
  }
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
