set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
let g:netrw_keepdir = 0

nnoremap <c-n> :25Lexplore<cr>
nnoremap <c-b> :25Lexplore %:p:h<cr>
