return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local nvim_treesitter = require("nvim-treesitter")

        local languages = {
            "c",
            "cpp",
            "css",
            "html",
            "javascript",
            "json",
            "jsx",
            "kdl",
            "lua",
            "luadoc",
            "luau",
            "make",
            "markdown",
            "markdown_inline",
            "rust",
            "scss",
            "toml",
            "typescript",
            "zig",
            "python",
            "yuck",
            "bash",
            "mermaid",
            "ebnf",
            "typst",
            "make",
            "go",
        }

        nvim_treesitter.install(languages):wait(10 * 60 * 1000)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
            end,
        })
    end,
}
