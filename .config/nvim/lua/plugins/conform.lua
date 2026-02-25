local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
            -- Prettier
            css = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            json5 = { "prettier" },
            jsonc = { "prettier" },
            jsx = { "prettier" },
            markdown = { "prettier" },
            scss = { "prettier" },
            tsx = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
            yaml = { "prettier" },

            -- Stylua
            lua = { "stylua" },
            luau = { "stylua" },

            -- Clang Format
            c = { "clang-format" },
            cpp = { "clang-format" },

            -- Black
            python = { "black" },

            -- Typst
            typst = { "prettypst" },
        },
        format_on_save = {},
        default_format_opts = {
            timeout_ms = 500,
            async = true,
            lsp_format = "fallback",
        },
    },
    config = function(_, opts)
        local conform = require("conform")

        conform.setup(opts)

        keymaps_helpers.map(keymaps.conform.format, function()
            conform.format({})
        end)

        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
