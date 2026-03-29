return {
    "linux-cultist/venv-selector.nvim",
    branch = "main",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
    lazy = false,
    ---@type venv-selector.Config
    opts = {
        settings = { -- Note: In newer versions, options are often under 'settings'
            options = {
                notify_user_on_venv_activation = true,
                enable_cached_venvs = true, -- Change to false so it doesn't remember your choice
                cached_venv_automatic_activation = true,
                activate_venv_in_terminal = true,
                require_lsp_activation = false, -- Disable this for now
            },
            search = {
                -- This looks for a .venv or venv folder in your current project
                my_venvs = { command = "fd -H -u python$ . --max-depth 4" }
            },
        },
    }
}
-- return
-- {
--     "benomahony/uv.nvim",
--     config = function()
--         require('uv').setup({
--             -- Auto-activate virtual environments when found
--             auto_activate_venv = true,
--             notify_activate_venv = true,
--
--             -- Auto commands for directory changes
--             auto_commands = true,
--
--             -- Integration with snacks picker
--             picker_integration = true,
--
--             -- Keymaps to register (set to false to disable)
--             keymaps = {
--                 prefix = "<leader>x",     -- Main prefix for uv commands
--                 commands = true,          -- Show uv commands menu (<leader>x)
--                 run_file = true,          -- Run current file (<leader>xr)
--                 run_selection = true,     -- Run selected code (<leader>xs)
--                 run_function = true,      -- Run function (<leader>xf)
--                 venv = true,              -- Environment management (<leader>xe)
--                 init = true,              -- Initialize uv project (<leader>xi)
--                 add = true,               -- Add a package (<leader>xa)
--                 remove = true,            -- Remove a package (<leader>xd)
--                 sync = true,              -- Sync packages (<leader>xc)
--                 sync_all = true,          -- Sync all packages, extras and groups (<leader>xC)
--             },
--
--             -- Execution options
--             execution = {
--                 -- Python run command template
--                 run_command = "uv run python",
--
--                 -- Show output in notifications
--                 notify_output = true,
--
--                 -- Notification timeout in ms
--                 notification_timeout = 10000,
--             },
--         })
--     end
-- }
