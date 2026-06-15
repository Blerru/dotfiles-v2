local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")
local icons = require("common.icons")

local FLOATING_WIDTH_RATIO = 0.75
local FLOATING_HEIGHT_RATIO = 0.75

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    enabled = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = { -- From https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#center-a-floating-nvim-tree-window
            float = {
                enable = true,
                open_win_config = function()

                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get()
                        - vim.opt.cmdheight:get()
                    local window_w = screen_w * FLOATING_WIDTH_RATIO
                    local window_h = screen_h * FLOATING_HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2)
                        - vim.opt.cmdheight:get()
                    return {
                        border = "rounded",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * FLOATING_WIDTH_RATIO)
            end,
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
        git = {
            ignore = false,
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
