local M = {}

M.setup = function()
  require('neo-tree').setup({
    open_files_do_not_replace_types = { "terminal", "trouble", "qf", "fugitive" },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
      },
      follow_current_file = {
        enabled = false,
      },
    },
  })
end

M.keys = {
  { '<C-n>', "<cmd>:Neotree<CR>" },
}

return M
