local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")
local icons = require("common.icons")

return {
    "folke/snacks.nvim",
    keys = {
        keymaps_helpers.make_lazy(keymaps.snacks.picker.find_files, function()
            Snacks.picker.files({ hidden = true })
        end),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.find_buffers,
            function()
                Snacks.picker.buffers()
            end
        ),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.find_recents,
            function()
                Snacks.picker.recent()
            end
        ),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.find_string, function()
            Snacks.picker.grep()
        end),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.git_log, function()
            Snacks.picker.git_log()
        end),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.git_status, function()
            Snacks.picker.git_status()
        end),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.lsp_symbols, function()
            Snacks.picker.lsp_symbols()
        end),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.lsp_workspace_symbols,
            function()
                Snacks.picker.lsp_workspace_symbols()
            end
        ),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.diagnostics, function()
            Snacks.picker.diagnostics_buffer()
        end),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.workspace_diagnostics,
            function()
                Snacks.picker.diagnostics()
            end
        ),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.goto_definition,
            function()
                Snacks.picker.lsp_definitions()
            end
        ),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.goto_declaration,
            function()
                Snacks.picker.lsp_declarations()
            end
        ),
        keymaps_helpers.make_lazy(keymaps.snacks.picker.references, function()
            Snacks.picker.lsp_references()
        end),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.goto_implementation,
            function()
                Snacks.picker.lsp_implementations()
            end
        ),
        keymaps_helpers.make_lazy(
            keymaps.snacks.picker.goto_type_definition,
            function()
                Snacks.picker.lsp_type_definitions()
            end
        ),
    },

    ---@type snacks.Config
    opts = {
        picker = {
            prompt = " ",
            sources = {},
            focus = "input",
            layout = {
                reverse = true,
                layout = {
                    box = "horizontal",
                    backdrop = false,
                    width = 0.8,
                    height = 0.9,
                    border = "none",
                    {
                        box = "vertical",
                        {
                            win = "list",
                            title = " Results ",
                            title_pos = "center",
                            border = true,
                        },
                        {
                            win = "input",
                            height = 1,
                            border = true,
                            title = "{title} {live} {flags}",
                            title_pos = "center",
                        },
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.45,
                        border = true,
                        title_pos = "center",
                    },
                },
            },
            ---@class snacks.picker.matcher.Config
            matcher = {
                fuzzy = true, -- use fuzzy matching
                smartcase = true, -- use smartcase
                ignorecase = true, -- use ignorecase
                sort_empty = false, -- sort results when the search string is empty
                filename_bonus = true, -- give bonus for matching file names (last part of the path)
                file_pos = true, -- support patterns like `file:line:col` and `file:line`
                -- the bonuses below, possibly require string concatenation and path normalization,
                -- so this can have a performance impact for large lists and increase memory usage
                cwd_bonus = false, -- give bonus for matching files in the cwd
                frecency = false, -- frecency bonus
                history_bonus = false, -- give more weight to chronological order
            },
            sort = {
                -- default sort is by score, text length and index
                fields = { "score:desc", "#text", "idx" },
            },
            ui_select = true, -- replace `vim.ui.select` with the snacks picker
            ---@class snacks.picker.formatters.Config
            formatters = {
                text = {
                    ft = nil, ---@type string? filetype for highlighting
                },
                file = {
                    filename_first = false, -- display filename before the file path
                    truncate = 40, -- truncate the file path to (roughly) this length
                    filename_only = false, -- only show the filename
                    icon_width = 2, -- width of the icon (in characters)
                    git_status_hl = true, -- use the git status highlight group for the filename
                },
                selected = {
                    show_always = false, -- only show the selected column when there are multiple selections
                    unselected = true, -- use the unselected icon for unselected items
                },
                severity = {
                    icons = true, -- show severity icons
                    level = false, -- show severity level
                    ---@type "left"|"right"
                    pos = "left", -- position of the diagnostics
                },
            },
            ---@class snacks.picker.previewers.Config
            previewers = {
                diff = {
                    builtin = true, -- use Neovim for previewing diffs (true) or use an external tool (false)
                    cmd = {},
                },
                git = {
                    builtin = true, -- use Neovim for previewing git output (true) or use git (false)
                    args = {}, -- additional arguments passed to the git command. Useful to set pager options usin `-c ...`
                },
                file = {
                    max_size = 1024 * 1024, -- 1MB
                    max_line_length = 500, -- max line length
                    ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
                },
                man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
            },
            win = {
                -- input window
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        [keymaps.common.history_forward.bind] = {
                            "history_forward",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.history_backward.bind] = {
                            "history_back",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.delete_word.bind] = {
                            "<c-s-w>",
                            mode = { "i" },
                            expr = true,
                            desc = "delete word",
                        },
                        [keymaps.common.confirm.bind] = {
                            "confirm",
                            mode = { "n", "i" },
                        },
                        [keymaps.common.list_up.bind] = {
                            "list_up",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.list_down.bind] = {
                            "list_down",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.confirm_secondary.bind] = {
                            { "pick_win", "jump" },
                            mode = { "n", "i" },
                        },
                        [keymaps.common.preview_up.bind] = {
                            "preview_scroll_up",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.preview_down.bind] = {
                            "preview_scroll_down",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.open_split.bind] = {
                            "edit_split",
                            mode = { "i", "n" },
                        },
                        [keymaps.common.open_vsplit.bind] = {
                            "edit_vsplit",
                            mode = { "n", "i" },
                        },
                    },
                    b = {
                        minipairs_disable = true,
                    },
                },
                -- result list window
                list = {
                    keys = {},
                    wo = {
                        conceallevel = 2,
                        concealcursor = "nvc",
                    },
                },
                -- preview window
                preview = {
                    keys = {},
                },
            },
            ---@class snacks.picker.icons
            icons = {
                files = {
                    enabled = true, -- show file icons
                    dir = "󰉋 ",
                    dir_open = "󰝰 ",
                    file = "󰈔 ",
                },
                keymaps = {
                    nowait = "󰓅 ",
                },
                tree = {
                    vertical = "│ ",
                    middle = "├╴",
                    last = "└╴",
                },
                undo = {
                    saved = " ",
                },
                ui = {
                    live = "󰐰 ",
                    hidden = "h",
                    ignored = "i",
                    follow = "f",
                    selected = "● ",
                    unselected = "○ ",
                    -- selected = " ",
                },
                git = vim.tbl_extend("error", {
                    enabled = true, -- show git icons
                    commit = "󰜘 ",
                }, icons.git),
                diagnostics = icons.diagnostics,
                lsp = {
                    unavailable = "",
                    enabled = " ",
                    disabled = " ",
                    attached = "󰖩 ",
                },
                kinds = icons.kind,
            },
            ---@class snacks.picker.db.Config
            db = {
                -- path to the sqlite3 library
                -- If not set, it will try to load the library by name.
                -- On Windows it will download the library from the internet.
                sqlite3_path = nil, ---@type string?
            },
            ---@class snacks.picker.debug
            debug = {
                scores = false, -- show scores in the list
                leaks = false, -- show when pickers don't get garbage collected
                explorer = false, -- show explorer debug info
                files = false, -- show file debug info
                grep = false, -- show file debug info
                proc = false, -- show proc debug info
                extmarks = false, -- show extmarks errors
            },
        },
    },
}
