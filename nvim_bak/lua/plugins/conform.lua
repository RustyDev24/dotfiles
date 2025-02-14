return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            go = { "goimports", "gofumpt", "golines" },
            python = { "black", "isort" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
        },
    },
}
