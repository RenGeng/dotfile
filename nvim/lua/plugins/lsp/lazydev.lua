-- replaces neodev.nvim: lua_ls types for vim.* and plugin APIs, only when editing lua
return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = {
            -- load luvit types when `vim.uv` is used
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
