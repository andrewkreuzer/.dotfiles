return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function ()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                home = "~/.cache/neorg",
              },
              index = "index.norg",
            }
          }
        }
      }
    end
  }
}
