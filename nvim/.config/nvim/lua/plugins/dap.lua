return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      ---@class dap
      ---@field adapters table<string, dap.Adapter|dap.AdapterFactory>
      ---@field configurations table<string, dap.Configuration[]>
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap",
        name = "lldb",
      }
      dap.configurations.zig = {
        {
          name = "Launch lldb";
          type = 'lldb';
          request = 'launch';
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/zig-out/bin/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
      require("dapui").setup()
    end,
    keys = {
      { "<C-p>", function() require("dapui").toggle() end, desc = "toggle dap ui" },
      { "<leader>pj", function() require("dapui").eval() end, desc = "evaulate value under cursor with dap" },
      { "<C-n>", function() require("dap").continue() end, desc = "dap continue" },
      { "<C-x>", function() require("dap").step_into() end, desc = "step into" },
      { "<C-s>", function() require("dap").step_over() end, desc = "step over" },
      { "<C-z>", function() require("dap").step_back() end, desc = "step back" },
      { "<C-b>", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
    }
  }
}
