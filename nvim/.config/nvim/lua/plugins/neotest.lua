return {
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-zig")({
            dap = {
              adapter = "lldb",
            }
          }),
        }
      })
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "lawrence-laz/neotest-zig",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "run nearest test" },
      { "<leader>tT", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "run nearest test with dap" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "toggle summary" },
      { "<leader>tr", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "run all tests in file" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "toggle test output panel" },
    }
  }
}
