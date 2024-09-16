return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "goimports",
      "gofumpt",
      "golines",
      "revive",
      "golangci-lint",
      "staticcheck",
      "gomodifytags",
      "impl",
    },
  },
}
