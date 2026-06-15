return {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    opts = {
        bar = {
            enable = function(buf, win, info)
                local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })
                local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = buf })

                -- Only show if the buffer is both visible and a file buffer
                -- Without this the thingy will appear on toggleterm for some reason
                return buflisted and buftype == ""
            end
        }
    }
}
