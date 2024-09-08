return {
    "echasnovski/mini.nvim",
    version = "false",
    config = function()
        require("mini.icons").setup()
        require("mini.indentscope").setup()
        require("mini.git").setup()
    end,
}
