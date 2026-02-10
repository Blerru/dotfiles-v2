local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")
local icons = require("common.icons")

return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        explorer = {
            replace_netrw = false, -- Replace netrw with the snacks explorer
            auto_open = false,
            trash = true, -- Use the system trash when deleting files
            win = {
                list = {
                    keys = {
                        ["<BS>"] = "explorer_up",
                        ["l"] = "confirm",
                        ["h"] = "explorer_close", -- close directory
                        ["a"] = "explorer_add",
                        ["d"] = "explorer_del",
                        ["r"] = "explorer_rename",
                        ["c"] = "explorer_copy",
                        ["m"] = "explorer_move",
                        ["o"] = "explorer_open", -- open with system application
                        ["P"] = "toggle_preview",
                        ["y"] = { "explorer_yank", mode = { "n", "x" } },
                        ["p"] = "explorer_paste",
                        ["u"] = "explorer_update",
                        ["<c-c>"] = "tcd",
                        ["<leader>/"] = "picker_grep",
                        ["<c-t>"] = "terminal",
                        ["I"] = "toggle_ignored",
                        ["."] = "toggle_hidden",
                        ["Z"] = "explorer_close_all",
                        ["]g"] = "explorer_git_next",
                        ["[g"] = "explorer_git_prev",
                        ["]d"] = "explorer_diagnostic_next",
                        ["[d"] = "explorer_diagnostic_prev",
                        ["]w"] = "explorer_warn_next",
                        ["[w"] = "explorer_warn_prev",
                        ["]e"] = "explorer_error_next",
                        ["[e"] = "explorer_error_prev",
                    },
                },
            },
        },
        picker = {
            sources = {
                explorer = {
                    hidden = true,
                },
            },
        },
    },
    keys = {
        keymaps_helpers.make_lazy(keymaps.nvim_tree.toggle, function()
            Snacks.explorer.open()
        end),
    },
}
