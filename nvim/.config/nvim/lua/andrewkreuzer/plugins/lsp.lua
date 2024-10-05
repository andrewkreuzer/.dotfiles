local function on_attach(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
end

local M = {}

M.setup = function(nix)
  local lspconfig = require('lspconfig')
  local lsp = require('lsp-zero').preset({})
  lsp.extend_lspconfig()

  lspconfig.gopls.setup {}
  -- lspconfig.pyright.setup {}
  lspconfig.ocamllsp.setup {}
  lspconfig.ts_ls.setup {}
  lspconfig.nil_ls.setup {}
  lspconfig.terraformls.setup {}
  local lua_opts = lsp.nvim_lua_ls()
  lspconfig.lua_ls.setup(lua_opts)
  lspconfig.jdtls.setup(lua_opts)
  lspconfig.yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          kubernetes = "*.yaml",
          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
          ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
          ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
          ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        },
      },
    },
  }

  lsp.format_on_save({
    servers = {
      ['lua_ls']        = { 'lua' },
      ['rust_analyzer'] = { 'rust' },
      ['terraformls']   = { 'terraform' },
      ['black']         = { 'py' },
      ['ts_ls']         = { 'javascript', 'typescript' },
      ['yamlls']        = { 'yaml' },
    }
  })

  if not nix then
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

  lsp.on_attach(on_attach)
  lsp.setup()
end

return M
