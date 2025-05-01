return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
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
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/zig-out/bin', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
      require("dapui").setup()
    end
  }
}
