local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPre" },
    keys = {
        keymaps_helpers.make_lazy(keymaps.ccc.pick, "<cmd>CccPick<cr>"),
    },
    opts = {},
    config = function(_, opts)
        local ccc = require("ccc")

        ccc.setup({
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
            inputs = {
                ccc.input.hsl,
                ccc.input.rgb,
                ccc.input.cmyk,
            },
        }, opts)
    end,
}
