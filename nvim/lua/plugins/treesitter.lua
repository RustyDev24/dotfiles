return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function() end,
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
      ft = {
        "javascript",
        "javascriptreact",
        "html",
        "typescript",
        "typescriptreact",
      },
    },
  },
}
