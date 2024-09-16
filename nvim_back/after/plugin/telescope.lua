local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>lS", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

vim.keymap.set("n", "<leader>ldD", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>ldd", function()
    builtin.diagnostics({ bufnr = 0 })
end)
vim.keymap.set("n", "<leader>lq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>lq", builtin.loclist, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})