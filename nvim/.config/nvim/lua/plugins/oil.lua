return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
      float = {
        padding = 10,
        max_width = 0.50,
        max_height = 0.50,
        win_options = {
          number = false,
          relativenumber = false,
        },
      },
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      },
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '<leader>o', function()
        require("oil").open_float(
          vim.fn.getcwd(),
          -- doesn't actually effect anything but needs to be present
          { preview = {split = "belowright"} }
        ) end
      },
      { '<leader>-', function()
        require("oil").open_float(
          nil,
          -- doesn't actually effect anything but needs to be present
          { preview = {split = "belowright"} }
        ) end
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
