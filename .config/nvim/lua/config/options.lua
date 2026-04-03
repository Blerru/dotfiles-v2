-- Usage
vim.opt.pumheight = 7 -- Number of elements shown in the auto-complete
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Registers
vim.opt.clipboard:append("unnamedplus")

-- Spacing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Appearance
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"
vim.opt.fillchars = { eob = " " }

-- Text display
vim.opt.wrap = false
vim.opt.linebreak = true

-- Spelling
vim.opt.spell = false
vim.opt.spelloptions = "camel"
vim.opt.spelllang = "en_us"

-- Misc
vim.opt.undofile = true
vim.opt.foldenable = false

-- Disabling Default File Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
