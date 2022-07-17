local M = {}

M.opt = function(o, v)
  if v == nil then
    v = true
  end
  vim.opt[o] = v
end

M.nmap = function(keys, cmds)
  vim.api.nvim_set_keymap('n', keys, cmds, { noremap = true, silent = true })
end

M.imap = function(keys, cmds)
  vim.api.nvim_set_keymap('i', keys, cmds, { noremap = true, silent = true })
end

return M
