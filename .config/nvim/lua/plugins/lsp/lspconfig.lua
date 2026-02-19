return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymaps = require("common.keymaps")
        local keymaps_helpers = require("common.keymaps.helpers")
        local icons = require("common.icons")

        -- Setup icons
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
                    [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
                    [vim.diagnostic.severity.INFO] = icons.diagnostics.Hint,
                    [vim.diagnostic.severity.HINT] = icons.diagnostics.Info,
                },
                texthl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                },
            },
            severity_sort = true,
            virtual_text = true,
        })

        -- Setup language servers
        local language_servers = {
            ["lua_ls"] = {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
            ["cssls"] = {},
            ["emmet_ls"] = {
                filetypes = {
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    "svelte",
                    "pug",
                    "typescriptreact",
                    "vue",
                },
                init_options = {
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                        },
                    },
                },
            },
            ["jsonls"] = {},
            ["clangd"] = {},
            ["zls"] = {},
            ["ts_ls"] = {},
            ["pyright"] = {},
            ["rust_analyzer"] = {},
        }

        for server, configuration in pairs(language_servers) do
            vim.lsp.config(server, configuration)
            vim.lsp.enable(server)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- Setup keys
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local function map(keymap, rhs)
                    keymaps_helpers.map(keymap, rhs, { buffer = event.buf })
                end

                map(
                    keymaps.lsp.show_line_diagnostics,
                    vim.diagnostic.open_float
                )
            end,
        })
    end,
}
