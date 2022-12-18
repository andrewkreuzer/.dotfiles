require('gitsigns').setup()

local nmap = require('andrewkreuzer.utils').nmap
nmap('<leader>gs', ":G<CR>")

require('cmp_git').setup()
