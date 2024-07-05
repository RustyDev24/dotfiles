return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() end,
    dependencies = {
        "windwp/nvim-autopairs",
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            event = "VeryLazy",
        },
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
