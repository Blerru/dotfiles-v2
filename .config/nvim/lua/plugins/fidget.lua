return {
    "j-hui/fidget.nvim",
    opts = {
        progress = {
            ignore = {
                function(msg)
                    return string.find(string.lower(msg.title), "diagnosing") ~= nil
                end,
            },
        },
        notification = {
            override_vim_notify = true,
        },
    },
}
