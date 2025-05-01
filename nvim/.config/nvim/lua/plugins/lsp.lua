return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.gopls.setup {}
      lspconfig.clangd.setup {}
      lspconfig.pyright.setup {}
      lspconfig.ocamllsp.setup {}
      lspconfig.ts_ls.setup {}
      lspconfig.nixd.setup {}
      lspconfig.zls.setup {}
      lspconfig.terraformls.setup {}
      lspconfig.jdtls.setup {}
      lspconfig.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemas = {
              -- kubernetes = "*.yaml",
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
              ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            },
          },
        },
      }

      if not NIX then
        require("mason-lspconfig").setup {
          ensure_installed = {
            'html',
            'cssls',
            'ts_ls',
            'pyright',
            'terraformls',
            'tflint',
            'jsonls',
            'svelte',
            'bashls',
            'dockerls',
            'yamlls',
            'html',
            'graphql',
            'gopls',
          }
        }
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufopts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
          vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
          vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
        end,
      })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = { "*.mc" },
        callback = function(_)
          vim.lsp.start({
            name = 'monkeyclsp',
            cmd = { '_build/install/default/bin/monkeyclsp' },
            root_dir = vim.fs.dirname(vim.fs.find({ 'App.mc' }, { upward = true })[1]),
          })
        end
      })
    end,
  },
  'onsails/lspkind-nvim',
}
