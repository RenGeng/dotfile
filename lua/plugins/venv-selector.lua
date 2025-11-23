return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
    lazy = false,
    keys = {
        { "<leader>venv", "<cmd>VenvSelect<cr>" },
    },
    ---@type venv-selector.Config
    opts = {

        options = {


            enable_default_searches = true,          -- switches all default searches on/off
            enable_cached_venvs = false,             -- use cached venvs that are activated automatically when a python file is registered with the LSP.
            cached_venv_automatic_activation = true, -- if set to false, the VenvSelectCached command becomes available to manually activate them.
            debug = true,
            set_environment_variables = true,
            require_lsp_activation = true,
        },
        search = {
            -- workspace = {
            --     command = "fd /bin/python$ $WORKSPACE_PATH --full-path --color never -E /proc -unrestricted",
            -- },
            cwd = { command = "fd -HI python$ $CWD" },
            poetry = false,
            virtualenvs = false,
            my_search = {
                command =
                "fd --follow --hidden --exclude .cache --exclude .local --exclude Library --exclude .vscode --exclude .virtualenvs --exclude .config --exclude .oh-my-zsh -I python$ ~/"
            },
        },
    }
}
