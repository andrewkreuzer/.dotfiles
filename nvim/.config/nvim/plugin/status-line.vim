" function! ActiveStatus()
"   let statusline=""
"   let statusline.="%1*"
"   let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
"   let statusline.="%2*"
"   let statusline.=""
"   let statusline.="%3*"
"   let statusline.="%{FugitiveHead()!=''?'\ \ '.FugitiveHead().'\ ':''}"
"   let statusline.="%4*"
"   let statusline.=""
"   let statusline.="%5*"
"   let statusline.="\ %<"
"   let statusline.="%f"
"   let statusline.="%{&modified?'\ \ +':''}"
"   let statusline.="%{&readonly?'\ \ ':''}"
"   let statusline.="%="
"   let statusline.="%6*"
"   let statusline.="\ "
"   let statusline.="%7*"
"   let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
"   let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
"   let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
"   let statusline.="%8*"
"   let statusline.="\ "
"   let statusline.="%2*"
"   let statusline.=""
"   let statusline.="%1*"
"   let statusline.="\ %2v"
"   let statusline.="\ %3p%%\ "
"   return statusline
" endfunction

" function! InactiveStatus()
"   let statusline=""
"   let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
"   let statusline.="%{FugitiveHead()!=''?'\ \ '.FugitiveHead().'\ ':'\ '}"
"   let statusline.="\ %<"
"   let statusline.="%f"
"   let statusline.="%{&modified?'\ \ +':''}"
"   let statusline.="%{&readonly?'\ \ ':''}"
"   let statusline.="%="
"   let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
"   let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
"   let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
"   let statusline.="\ \ "
"   let statusline.="\ %2v"
"   let statusline.="\ %3p%%\ "
"   return statusline
" endfunction

" set laststatus=2
" set statusline=%!ActiveStatus()
" hi User1 guibg=#36A3D9  guifg=#D9D7CE
" hi User2 guibg=#FF7733  guifg=#36A3D9
" hi User3 guibg=#FF7733  guifg=#14191F
" hi User4 guibg=#14191F  guifg=#FF7733
" hi User5 guibg=#14191F  guifg=#D9D7CE
" hi User6 guibg=#14191F  guifg=#BBE67E
" hi User7 guibg=#BBE67E  guifg=#14191F
" hi User8 guibg=#BBE67E  guifg=#FF7733

" augroup status
"   autocmd!
"   autocmd WinEnter * setlocal statusline=%!ActiveStatus()
"   autocmd WinLeave * setlocal statusline=%!InactiveStatus()
"   " autocmd ColorScheme kalisi if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
" augroup END

