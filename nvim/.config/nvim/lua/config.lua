local M = {}

M.setup = function()
  require('options')
  require('autocmds')
  require('keymaps')
  require('_lazy')
  require('theme')
end

M.enable_monkeyc_treesitter = function()
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.monkeyc = {
    install_info = {
      url = "~/personal/garmin/tree-sitter-monkeyc",
      files = { "src/parser.c" },
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
    filetype = "monkeyc",
  }
end

return M
