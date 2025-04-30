return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release",
        },
    },
    config = function()
        require("telescope").setup({
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
        })
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")
    end,
}
