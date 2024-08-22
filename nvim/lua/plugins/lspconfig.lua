---@diagnostic disable: inject-field
local config = function()
    local lspconfig = require("lspconfig")

    local servers = {
        "lua_ls",
        "cssls",
        "gopls",
        "html",
        "pyright",
        "clangd",
        "tsserver",
        "eslint",
        "tailwindcss",
        "emmet_language_server",
        "clangd",
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local function lsp_keymaps(bufnr)
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        keymap(bufnr, "n", "<leader>ldp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        keymap(bufnr, "n", "<leader>ldn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        keymap(
            bufnr,
            "n",
            "<leader>ih",
            "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
            opts
        )
    end

    local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)

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

    local function common_capabilities()
        local _, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        return cmp_nvim_lsp.default_capabilities()
    end

    for _, server in pairs(servers) do
        local opts = {
            on_attach = on_attach,
            capabilities = common_capabilities(),
        }

        local require_ok, settings = pcall(require, "user.lsp." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        if server == "lua_ls" then
            require("neodev").setup({})
        end

        lspconfig[server].setup(opts)
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
        "hrsh7th/nvim-cmp",
        --        "creativenull/efmls-configs-nvim"
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = config,
    event = { "BufReadPre", "BufNewFile" },
}
