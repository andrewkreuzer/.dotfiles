local M = {}

M.setup = function()
  require('neo-tree').setup({
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  })
end

M.keys = {
  { '<C-n>', "<cmd>:Neotree<CR>" },
}

return M
