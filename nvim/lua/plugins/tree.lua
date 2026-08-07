return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local api = require("nvim-tree.api")

        local function copy_name_no_ext(node)
            local name = vim.fn.fnamemodify(node.name, ":r")
            vim.fn.setreg("+", name)
            vim.fn.setreg('"', name)
            vim.notify("Copied " .. name)
        end

        local function on_attach(bufnr)
            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set("n", "y", function()
                copy_name_no_ext(api.tree.get_node_under_cursor())
            end, { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "Copy name w/o ext" })
        end

        nvimtree.setup({
            on_attach = on_attach,
            view = {
                width = 35,
            },
            update_focused_file = {
                enable = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store", "__pycache__", ".venv/", ".mypy_cache", ".git/", ".ruff_cache", ".pytest*" },
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local keymap = vim.keymap                                                                   -- for conciseness

        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        keymap.set(
            "n",
            "<leader>ef",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        )                                                                                               -- toggle file explorer on current file
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })   -- refresh file explorer
    end,
}
