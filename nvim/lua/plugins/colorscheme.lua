-- return {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme cyberdream")
--
--         require("cyberdream").setup({
--             -- Enable transparent background
--             transparent = false,
--
--             -- Enable italics comments
--             italic_comments = true,
--
--             -- Replace all fillchars with ' ' for the ultimate clean look
--             hide_fillchars = false,
--
--             -- Modern borderless telescope theme - also applies to fzf-lua
--             borderless_telescope = true,
--
--             -- Set terminal colors used in `:terminal`
--             terminal_colors = true,
--
--             -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
--             -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
--             cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
--
--             -- Disable or enable colorscheme extensions
--             extensions = {
--                 telescope = true,
--                 notify = true,
--             },
--         })
--     end,
-- }
--

-- return {
--     'navarasu/onedark.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme onedark")
--
--         require("onedark").setup({
--             style = "deep",
--             transparent = true,
--         })
--         require('onedark').load()
--     end
-- }

-- return {
--     "uhs-robert/oasis.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("oasis").setup(
--             {
--                 style = "lagoon"
--             }
--         )                            -- (see Configuration below for all customization options)
--         vim.cmd.colorscheme("oasis") -- After setup, apply theme (or a any style like "oasis-night")
--     end
-- }
--
--
--
--
-- return {
--     "nyoom-engineering/oxocarbon.nvim",
--     config = function()
--         vim.opt.background = "dark"
--         vim.cmd.colorscheme "oxocarbon"
--     end
-- }
--
return {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd([[colorscheme teide]])
        require("teide").setup({ style = "darker", })
    end

}
