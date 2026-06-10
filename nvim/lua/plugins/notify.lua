return {
    'rcarriga/nvim-notify',
    config = function()
        vim.notify = require("notify")
        vim.notify.setup({
            timeout = 3000,
            background_colour = "#000000",
            render = "compact",
            stages = "fade",
            top_down = false,
        })
    end
}
