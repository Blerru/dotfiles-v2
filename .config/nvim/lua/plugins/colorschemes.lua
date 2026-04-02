local enabled_theme = "oskarnurm/koda.nvim"
local theme_plugins = {
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1001,
        config = function(_, opts)
            local palette = require("oldworld.palette")

            require("oldworld").setup(vim.tbl_extend("force", opts, {
                variant = "default",
                styles = {
                    booleans = { italic = true, bold = true },
                },
                integrations = {
                    treesitter = true,
                },
                highlight_overrides = {
                    -- Telescope
                    TelescopePreviewTitle = { fg = palette.fg, bg = palette.bg },
                    TelescopeResultsTitle = { fg = palette.fg, bg = palette.bg },
                    TelescopeBorder = { fg = palette.gray3, bg = palette.bg },
                },
            }))

            vim.cmd.colorscheme("oldworld")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = false,
            custom_highlights = function(colors)
                return {
                    Pmenu = { bg = colors.surface0 },
                }
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    {
        "tiagovla/tokyodark.nvim",
        opts = {},
        priority = 1000,
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional

            vim.cmd.colorscheme("tokyodark")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function(_, opts)
            require("tokyonight").setup(opts) -- calling setup is optional

            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup()
            vim.cmd.colorscheme("monokai-pro")
        end,
    },
    {
        "oskarnurm/koda.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function(_, opts)
            local koda = require("koda");

            koda.setup(vim.tbl_extend("force", opts, {
                transparent_background = true,
                on_highlights = function(hl, c)
                    local border_color = koda.blend(c.border, c.bg, 0.5)
                    hl.WinSeparator = { fg =  border_color }
                    hl.FloatBorder = { fg =  border_color }
                end
            }))

            vim.cmd("colorscheme koda")
        end,
    },
}

for _, plugin in ipairs(theme_plugins) do
    local name = plugin[1]
    plugin.enabled = name == enabled_theme
end

return theme_plugins
