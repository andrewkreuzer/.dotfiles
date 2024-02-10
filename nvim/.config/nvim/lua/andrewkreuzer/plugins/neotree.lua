local nmap = require('andrewkreuzer.utils').nmap

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

return M
