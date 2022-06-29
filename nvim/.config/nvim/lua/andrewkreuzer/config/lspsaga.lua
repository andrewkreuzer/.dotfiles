local saga = require('lspsaga')
saga.init_lsp_saga()

local nmap = require('andrewkreuzer.utils').nmap
nmap('<leader>sr', "<cmd>lua require('lspsaga.rename').lsp_rename()<CR>")
nmap('<leader>sh', "<cmd>lua require('lspsaga.finder').lsp_finder()<CR>")
nmap('<leader>sca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
nmap('K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
nmap('S', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
