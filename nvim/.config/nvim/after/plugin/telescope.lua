local nmap = require('andrewkreuzer.utils').nmap
nmap('<leader>sw', "<cmd>:lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
nmap('<leader>ss', "<cmd>:lua require('telescope.builtin').live_grep()<CR>")
nmap('<leader>sg', "<cmd>:lua require('telescope.builtin').git_files()<CR>")
nmap('<Leader>sf', "<cmd>:lua require('telescope.builtin').find_files({hidden=true})<CR>")
nmap('<leader>pb', "<cmd>:lua require('telescope.builtin').buffers()<CR>")
nmap('<leader>vh', "<cmd>:lua require('telescope.builtin').help_tags()<CR>")
