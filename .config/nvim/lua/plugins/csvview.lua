return {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    opts = {
        parser = { comments = { "#", "//" } },
        keymaps = {
            textobject_field_inner = { "if", mode = { "o", "x" } },
            textobject_field_outer = { "af", mode = { "o", "x" } },
            jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
            jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
            jump_next_row = { "<Enter>", mode = { "n", "v" } },
            jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
        },
        sticky_header = {
            --- Whether to enable the sticky header feature
            --- @type boolean
            enabled = true,
        },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
