-- lazygit in a snacks terminal float. `q` only hides the float: lazygit keeps running, so reopening
-- lands exactly where you left it (folded dirs, panel, cursor). Real quit: Q or <c-c>.
local main = vim.fn.has("mac") == 1 and vim.fn.expand("~/Library/Application Support/lazygit/config.yml")
    or vim.fn.expand("~/.config/lazygit/config.yml")
local overlay = vim.fn.stdpath("cache") .. "/lazygit-nvim.yml"
local cmd = { "lazygit", "-ucf", main .. "," .. overlay }
local opts = { win = { keys = { term_normal = false } } } -- lazygit needs <esc><esc>
local term

return {
    "folke/snacks.nvim",
    init = function()
        -- called by lazygit via $NVIM: hide the float; "e" then opens the file in the window lazygit came from
        function _G.LazygitHide(file, line)
            vim.schedule(function()
                term:hide()
                vim.cmd("checktime")
                if file then
                    vim.cmd("edit +" .. line .. " " .. vim.fn.fnameescape(file))
                end
            end)
            return ""
        end

        -- ponytail: filenames containing ' break the vim string, fine in practice
        local remote = [[nvim --server "$NVIM" --remote-expr "v:lua.LazygitHide(%s)"]]
        vim.fn.writefile({
            "os:",
            "  editPreset: nvim-remote",
            "  edit: |-",
            "    " .. remote:format([['"{{filename}}"', 1]]),
            "  editAtLine: |-",
            "    " .. remote:format([['"{{filename}}"', {{line}}]]),
            "keybinding:",
            "  universal:",
            "    quit: <disabled>",
            "customCommands:",
            "  - key: q",
            "    context: global",
            "    description: hide (lazygit keeps running)",
            "    command: |-",
            "      " .. remote:format(""),
        }, overlay)
    end,
    keys = {
        {
            "<leader>lg",
            function()
                term = Snacks.terminal(cmd, opts)
            end,
            desc = "Open lazy git",
        },
    },
}
