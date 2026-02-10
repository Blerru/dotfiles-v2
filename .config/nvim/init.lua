-- It is important that lazy gets loaded last
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.user_commands")

-- I have no clue where else to put this. Maybe in the future there will be more file types and I will be able to put this in a "config.file-types"
vim.filetype.add({
    extension = {
        mdx = "markdown",
    },
})
