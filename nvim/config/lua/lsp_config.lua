require("mason").setup()

vim.lsp.set_log_level("debug")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local servers = {
    lua_ls = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    },
    ruby_lsp = {
      filetypes = { "ruby" }
    },
  --  rubocop = {
  --    -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
  --    cmd = { "bundle", "exec", "rubocop", "--lsp" },
  --    root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
  --  },
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
end

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
