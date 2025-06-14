return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  opts = {
    keymap = { preset = "enter" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = { auto_show = true },
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { enabled = true },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
