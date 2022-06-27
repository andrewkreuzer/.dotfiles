local saga = require('lspsaga')
saga.init_lsp_saga()

local nmap = require('utils').nmap
nmap('sr', "<cmd>lua require('lspsaga.rename').lsp_rename()<CR>")
nmap('sh', "<cmd>lua require('lspsaga.finder').lsp_finder()<CR>")
nmap('sca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
nmap('K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
nmap('S', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
