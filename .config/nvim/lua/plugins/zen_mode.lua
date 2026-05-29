local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
        keymaps_helpers.make_lazy(keymaps.zen_mode.toggle, "<cmd>ZenMode<cr>")
    }
}
