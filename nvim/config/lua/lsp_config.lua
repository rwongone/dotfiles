require("mason").setup()

vim.lsp.set_log_level("debug")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local telescope_builtin = require("telescope.builtin")

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

local on_attach = function(_, bufnr)
    local opts_buffer = { silent = true, buffer = bufnr }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts_buffer)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts_buffer)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_buffer)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts_buffer)
    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts_buffer)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts_buffer)
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
