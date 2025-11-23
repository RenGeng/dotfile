return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        -- local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "ruff",
                "ansible-language-server",
                "ansible-lint",
                "gitlab-ci-ls",
                "helm-ls",
                "lua-language-server",
                "mypy",
                "prettier",
                "python-lsp-server",
                "shellcheck",
                "shfmt",
                "terraform-ls",
                "tflint",
                "yamlfmt"
            },
        })
    end,
}
