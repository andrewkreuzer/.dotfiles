require('neogit').setup {}
require('gitsigns').setup()

local nmap = require('andrewkreuzer.utils').nmap
nmap('<leader>gs', "<cmd>lua require('neogit').open({kind='split'})<CR>")
