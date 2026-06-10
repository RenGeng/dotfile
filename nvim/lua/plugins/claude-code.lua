return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
        terminal = {
            split_width_percentage = 0.50,
            snacks_win_opts = {
                min_width = 20,
                max_width = 0.95,
            },

            provider = "native",
            fix_streamed_paste = "auto",
            -- split_width_percentage = 0.40,

        },
    },
    config = true,
    keys = {
        { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
        { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
        { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
        { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
        { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                 desc = "Send to Claude" },
        {
            "<leader>cs",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        },
        -- Diff management
        { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
}
