---@diagnostic disable: inject-field
local config = function()
  local servers = {
    "lua_ls",
    "cssls",
    "gopls",
    "html",
    "pyright",
    "eslint",
    "tailwindcss",
    "emmet_language_server",
    "clangd",
    "zls",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
      linehl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = true }
    local keymap = vim.keymap.set
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gI", vim.lsp.buf.implementation, opts)
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "gl", vim.diagnostic.open_float, opts)

    keymap("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, opts)
    keymap("n", "<C-k>", function()
      vim.lsp.buf.signature_help({ border = "rounded" })
    end, opts)
    keymap("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr))
    end, opts)
    keymap("n", "<leader>ldp", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    keymap("n", "<leader>ldn", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
  end

  local on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    vim.lsp.inlay_hint.enable(false) -- do not enable inlay hints by default

    if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = {
          tokenTypes = semantic.tokenTypes,
          tokenModifiers = semantic.tokenModifiers,
        },
        range = true,
      }
    end
  end

  local capabilities = require("blink.cmp").get_lsp_capabilities()

  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  for _, server in pairs(servers) do
    local require_ok, settings = pcall(require, "user.lsp." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("lazydev").setup()
    end

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
    },
    "saghen/blink.cmp",
    { "j-hui/fidget.nvim", opts = {} },
  },

  config = config,
  event = { "BufReadPre", "BufNewFile" },
}
