return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            -- Formatters
            "clang-format",
            "prettier",
            "stylua",
            "black",

            -- LSPs
            "bash-language-server",
            "clangd",
            "css-lsp",
            "emmet-language-server",
            "json-lsp",
            "lua-language-server",
            "luau-lsp",
            "typescript-lanaguage-server",
            "zig",
            "pyright",
            "zls",
            "rust-analyzer",

            -- DAPs
            "codelldb",
        },
        run_on_start = false,
    },
    config = function(_, opts)
        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup(opts)
    end,
}
