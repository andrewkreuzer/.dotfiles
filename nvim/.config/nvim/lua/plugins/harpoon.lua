return {
  {
    'ThePrimeagen/harpoon',
    config = function ()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
        },
      })
    end,

    keys = {
      { "<C-s>", function() require("dap").step_over() end, desc = "step over" },
      { '<leader>tj', function() require('harpoon.term').gotoTerminal(1) end, desc = "open termial 1" },
      { '<leader>tk', function() require('harpoon.term').gotoTerminal(2) end, desc = "open termial 2" },
      { '<leader>tl', function() require('harpoon.term').gotoTerminal(3) end, desc = "open termial 3" },
      { '<leader>t;', function() require('harpoon.term').gotoTerminal(4) end, desc = "open termial 4" },
    }
  }
}
