return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            go = { "staticcheck", "golangcilint" },
            python = { "ruff" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
        },
    },
}
