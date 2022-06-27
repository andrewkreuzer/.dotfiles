require('neogit').setup {}
require('gitsigns').setup()

local nmap = require('utils').nmap
nmap('gs', "<cmd>lua require('neogit').open({kind='split'})<CR>")
-- nmap('gc', "<cmd>
