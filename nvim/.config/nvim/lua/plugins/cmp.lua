return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local luasnipVSCode = require('luasnip/loaders/from_vscode')
      local lspkind = require('lspkind')

      local has_words_before = function()
        if vim.api.nvim_get_option_value('buftype', {}) == 'prompt' then
          return false
        end
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local get_bufnrs = function()
        local bufs = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          bufs[vim.api.nvim_win_get_buf(win)] = true
        end
        return vim.tbl_keys(bufs)
      end


      luasnipVSCode.lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
              -- luasnip is causing a lot or issues
              -- elseif luasnip.expand_or_jumpable() then
              --   luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
              -- luasnip is causing a lot or issues
              -- elseif luasnip.jumpable(-1) then
              --   luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer',  option = { get_bufnrs = get_bufnrs } },
          { name = 'path' },
          { name = 'copilot' },
          {
            name = 'tmux',
            options = {
              all_panes = true,
            }
          },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            with_text = true,
            menu = ({
              buffer = "(Buffer)",
              nvim_lsp = "(LSP)",
              luasnip = "(LuaSnip)",
              path = "(Path)",
              copilot = "(Copilot)",
              tmux = "(Tmux)",
            }),
            before = function(entry, vim_item)
              if vim.tbl_contains({ 'path' }, entry.source.name) then
                local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if icon then
                  vim_item.kind = icon
                  vim_item.menu = "    (" .. hl_group .. ")"
                  vim_item.kind_hl_group = hl_group
                  return vim_item
                end
              end
              local kind = require('lspkind').cmp_format({ mode = "symbol" })(entry, vim_item)
              if entry.source.name == "copilot" then
                kind.kind = ''
              end
              kind.kind = kind.kind .. ' '
              return kind
            end
          }),
        }
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'copilot' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        view = {
          entries = { name = 'wildmenu', separator = '|' }
        },
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'rg' },
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        })
      })
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
    }
  },
  {
    'petertriho/cmp-git',
    config = function()
      require('cmp_git').setup()
    end
  },
  'lukas-reineke/cmp-rg',
  'andersevenrud/compe-tmux',
  {
    'zbirenbaum/copilot-cmp',
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({
            filetypes = {
              gitcommit = true,
            }
          })
        end,
      }
    }
  },
}

