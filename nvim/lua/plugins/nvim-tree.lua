return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 40,
                side = "right",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
                git_ignored = true,
            },
        })
    end,
    keys = {
        { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "nvim tree" },
    },
}
