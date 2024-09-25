return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup({
                    ui = {
                        border = "rounded",
                    },
                })
            end,
        },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "gopls",
                "lua_ls",
                "stylua",
                "golines",
                "luacheck",
                "gomodifytags",
                "gofumpt",
                "goimports-reviser",
                "html",
                "cssls",
                "revive",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "emmet-language-server",
                "eslint-lsp",
                "prettierd",
                "clangd",
                "clang-format",
            },
            auto_update = true,
        })
    end,
}
