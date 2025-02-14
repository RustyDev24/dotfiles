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
      lua = { "luacheck" },
    },
  },
  config = function(_, opts)
    require("lint").linters_by_ft = opts.linters_by_ft

    local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      group = lint_group,
      callback = function()
        require("lint").try_lint()
      end,
      pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.py", "*.go", "*.lua" },
    })
  end,
}
