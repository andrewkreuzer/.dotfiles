local M = {}

M.setup = function()
  require('lualine').setup({
    options = { theme = 'ayu' },
  })
end

return M
