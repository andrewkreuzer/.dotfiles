local nmap = require('utils').nmap
local tmap = require('utils').tmap
local vmap = require('utils').vmap

nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')
tmap('<A-h>', '<C-\\><C-n><C-w>h')
tmap('<A-j>', '<C-\\><C-n><C-w>j')
tmap('<A-k>', '<C-\\><C-n><C-w>k')
tmap('<A-l>', '<C-\\><C-n><C-w>l')

nmap('<Up>', '<C-y>')
nmap('<Down>', '<C-e>')
nmap('<Right>', 'gt')
nmap('<Left>',  'gT')
nmap('<leader>tc', ':tabclose<CR>')

-- Search highlighting cancel
nmap('<Esc><Esc>', ':silent! nohls<cr>')

nmap('<leader>gs', ":G<CR>")

tmap('\\\\', '<C-\\><C-n><CR>')

-- Remove whitespace
nmap('<leader>sws', ':%s/\\s\\+$//<CR>')

-- Try and make sure to not mangle space items
tmap('<S-Space>', '<Space>')
tmap('<C-Space>', '<Space>')

vmap('J', ':m >+1<CR>gv=gv')
vmap('K', ':m <-2<CR>gv=gv')

-- replace currently selected text with
-- default register without yanking it
vmap('<leader>p', '"_dP')

-- quickfix
nmap('<C-Down>', ':cnext<CR>zz')
nmap('<C-Up>', ':cprev<CR>zz')
nmap('<C-c>', ':cclose<CR>')

-- move to center of buffer when searching
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

nmap('<leader>hl', ':nohl<CR>')
