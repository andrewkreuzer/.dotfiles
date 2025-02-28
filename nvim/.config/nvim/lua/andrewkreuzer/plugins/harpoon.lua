local nmap = require('andrewkreuzer.utils').nmap

local M = {}

M.setup = function()
  require("harpoon").setup({
    global_settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
    },
  })
end

M.keys = {
  { '<leader>tj', "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>" },
  { '<leader>tk', "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>" },
  { '<leader>tl', "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>" },
  { '<leader>t;', "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>" },
  { '<leader>jj', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },

  -- { '<leader>ha',    ":lua require('harpoon.mark').add_file()<CR>" },
  -- { '<leader>hr',    ":lua require('harpoon.mark').rm_file()<CR>" },
  -- { '<C-a>',         " :lua require('harpoon.ui').nav_file(1)<CR>" },
  -- { '<C-s>',         " :lua require('harpoon.ui').nav_file(2)<CR>" },
  -- { '<C-d>',         ":lua require('harpoon.ui').nav_file(3)<CR>" },
  -- { '<C-f>',         ":lua require('harpoon.ui').nav_file(4)<CR>" },
  -- { '<leader>ts',    ":lua require('harpoon.term').sendCommand(1, 'ls -al\n')<CR>" },
  -- { '<leader>ce',    ":lua require('harpoon.term').sendCommand(1, 2)<CR>" },
  -- { '<leader><C-r>', ":lua require('harpoon.mark').shorten_list()<CR>" },
  -- { '<leader><C-d>', ":lua require('harpoon.mark').clear_all()<CR>" },
  -- { '<leader>r',     ":lua require('harpoon.mark').promote()<CR>" },
}

return M
