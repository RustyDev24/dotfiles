return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "ray-x/guihua.lua",
    },
    config = function()
        require("go").setup({})
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
