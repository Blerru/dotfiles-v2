return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = false,
    opts = {
        options = {
            indicator = {
                style = "icon",
            },
            separator_style = { " ", " " },
            show_buffer_close_icons = false,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true, -- use a "true" to enable the default, or set your own character
                },
            },
        },
    },
}
