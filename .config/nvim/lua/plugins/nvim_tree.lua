local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")
local icons = require("common.icons")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = false,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                    hidden = true,
                    diagnostics = true,
                    bookmarks = true,
                },
                glyphs = {
                    git = {
                        unstaged = icons.git.nstaged,
                        staged = icons.git.staged,
                        unmerged = icons.git.unmerged,
                        renamed = icons.git.renamed,
                        untracked = icons.git.untracked,
                        deleted = icons.git.deleted,
                        ignored = icons.git.ignored,
                    },
                },
            },
        },
    },
    keys = {
        keymaps_helpers.make_lazy(
            keymaps.nvim_tree.toggle,
            "<cmd>NvimTreeFindFileToggle<cr>"
        ),
    },
    config = function(_, opts)
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup(opts)
    end,
}
