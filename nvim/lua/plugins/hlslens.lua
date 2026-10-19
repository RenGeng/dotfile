return {
    "kevinhwang91/nvim-hlslens",
    keys = { "/", "?", "n", "N", "*", "#", "g*", "g#" },
    config = function()
        require("hlslens").setup({
            calm_down = false, -- keep highlight + lens when cursor leaves match
        })

        local opts = { noremap = true, silent = true }
        -- zz: keep match centered (these override the nzz/Nzz maps in core/keymaps.lua)
        vim.keymap.set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>]],
            opts)
        vim.keymap.set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>]],
            opts)
        vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
        vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
        vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
        vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
    end,
}
