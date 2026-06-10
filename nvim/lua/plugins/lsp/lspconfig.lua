return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
        {
            "ray-x/lsp_signature.nvim",
            event = "InsertEnter",
            opts = {
                bind = true,
                hint_prefix = {
                    above = "↙ ", -- when the hint is on the line above the current line
                    current = "← ", -- when the hint is on the same line
                    below = "↖ " -- when the hint is on the line below the current line
                },
                handler_opts = {
                    border = "rounded"
                }
            },
            config = function(_, opts) require 'lsp_signature'.setup(opts) end
        }
    },
    config = function()
        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup()
        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", function() vim.diagnostic.jump { count = -1, float = true } end, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", function() vim.diagnostic.jump { count = 1, float = true } end, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()
        vim.lsp.config("*", { capabilities = capabilities })

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        --     -- vim.diagnostic.config(hl, { text = icon, texthl = hl, numhl = "" })
        -- end

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                }
            },
        })

        vim.lsp.config("ruff", {
            settings = {
                ruff = {
                    -- enable ruff lsp
                    lsp = {
                        enabled = true,
                    },
                },
            },
        })

        vim.lsp.config("pyright", {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                        extraPaths = { "." },
                    },
                    pythonPath = "./.venv/bin/python"
                }
            }
        })


        -- -- vim.lsp.config("pylsp", {
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 -- Disable redundant linting and formatting (ruff handles these)
        --                 pycodestyle = { enabled = false },
        --                 mccabe = { enabled = false },
        --                 pyflakes = { enabled = false },
        --                 flake8 = { enabled = false },
        --                 yapf = { enabled = false },
        --                 autopep8 = { enabled = false },
        --                 pylint = { enabled = false },
        --                 -- Enable Jedi for navigation (gd, hover, etc.)
        --                 jedi_definition = { enabled = true, follow_imports = true, follow_builtin_imports = true },
        --                 jedi_hover = { enabled = true },
        --                 jedi_references = { enabled = true },
        --                 jedi_completion = { enabled = true },
        --             }
        --         }
        --     }
        -- })

        -- terraform-ls: needs explicit config for root detection + indexing
        -- IMPORTANT: run `terraform init` in project so provider schemas are available
        vim.lsp.config("terraformls", {
            filetypes = { "terraform", "terraform-vars" },
            root_markers = { "*.tf", ".terraform", ".git" },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                if server_name == "pylsp" then
                    return
                end
                vim.lsp.enable(server_name)
            end,
        })
    end,
}
