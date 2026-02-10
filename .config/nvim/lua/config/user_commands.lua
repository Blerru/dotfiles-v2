vim.api.nvim_create_user_command("UsePlainMode", function()
    -- Disable autocomplete
    require("cmp").setup({ enabled = false })

    -- Disable diagnostics
    vim.diagnostic.enable(false)
end, {})
