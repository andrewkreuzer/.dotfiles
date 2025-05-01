local M = {}

M.nmap = function(keys, cmds)
  vim.keymap.set('n', keys, cmds, { noremap = true, silent = true })
end

M.imap = function(keys, cmds)
  vim.keymap.set('i', keys, cmds, { noremap = true, silent = true })
end

M.tmap = function(keys, cmds)
  vim.keymap.set('t', keys, cmds, { noremap = true, silent = true })
end

M.vmap = function(keys, cmds)
  vim.keymap.set('v', keys, cmds, { noremap = true, silent = true })
end

return M
