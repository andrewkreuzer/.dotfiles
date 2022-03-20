nnoremap <leader>ht :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>tl :lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap <leader>t' :lua require("harpoon.term").gotoTerminal(4)<CR>

nnoremap <leader>ts :lua require("harpoon.term").sendCommand(1, "ls -al\n")<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hr :lua require("harpoon.mark").rm_file()<CR>
" nnoremap <C-a> :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap <C-s> :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap <C-d> :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <C-f> :lua require("harpoon.ui").nav_file(4)<CR>

" nnoremap <leader><C-r> :lua require("harpoon.mark").shorten_list()<CR>
" nnoremap <leader><C-d> :lua require("harpoon.mark").clear_all()<CR>
" nnoremap <leader>r :lua require("harpoon.mark").promote()<CR>
