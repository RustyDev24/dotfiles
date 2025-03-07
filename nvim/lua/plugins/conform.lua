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
      lua = { "stylua" },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("conform").format()
      end,
      desc = "Format document",
    },
  },
}
