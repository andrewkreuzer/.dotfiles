local M = {}

M.setup = function()
  require('lualine').setup({
    options = { theme = 'ayu' },
    sections = {
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        }
      },
    },
  })
end

return M
