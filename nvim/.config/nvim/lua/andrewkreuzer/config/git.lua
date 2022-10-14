require('gitsigns').setup()
require("diffview").setup()

require('neogit').setup {
  kind = "split_above",
   -- signs = {
   --  -- { CLOSED, OPENED }
   --  section = { "ﲒ", "ﲐ" },
   --  item = { "ﲒ", "ﲐ" },
   --  hunk = { "", "" },
  -- },
  integrations = {
    diffview = true
  },
}

local nmap = require('andrewkreuzer.utils').nmap
nmap('<leader>gs', "<cmd>lua require('neogit').open()<CR>")
