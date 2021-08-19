nnoremap <Leader>sg :GFiles<CR>
nnoremap <Leader>sf :Files<CR>
nnoremap <Leader>ss :Rg<CR>
nnoremap <Leader>sch :History/<CR>
nnoremap <Leader>sh :History<CR>
nnoremap <Leader>sa :Buffers<CR>

command! -bang DevEnvFiles call fzf#vim#files("~/work/dev-env", <bang>0)
