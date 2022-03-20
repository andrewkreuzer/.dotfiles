" Undotree
nnoremap <Leader><C-u> :UndotreeToggle<CR>

if !exists('g:undotree_SplitWidth')
  let g:undotree_SplitWidth = 30
endif

if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 2
endif

if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 0
endif

if !exists('g:undotree_HighlightChangedWithSign')
    let g:undotree_HighlightChangedWithSign = 1
endif


