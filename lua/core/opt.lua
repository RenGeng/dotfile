-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
-- vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
vim.opt.number = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- vim.opt.wrap = true -- Enable line wrapping
-- vim.opt.linebreak = true -- Don't break words when wrapping lines

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- tabs & indentation
vim.opt.tabstop = 4       -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 4    -- 2 spaces for indent width
vim.opt.expandtab = true  -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.softtabstop = 4

vim.opt.laststatus = 3 -- to have current file status line across windows split

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldtext = ""

vim.lsp.set_log_level("off")
vim.opt.backspace = { "indent", "eol", "start" }

-- for gitlab-ci-ls language server
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.gitlab-ci*.{yml,yaml}",
    callback = function()
        vim.bo.filetype = "yaml.gitlab"
    end,
})

-- for spelling
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.spell = true
vim.opt.spelllang = { "en_us", "fr" }
vim.g.spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell'

-- for display diagnostic on line
vim.diagnostic.config({
    virtual_text = {
        enabled = true,
        severity = {
            max = vim.diagnostic.severity.WARN,
        },
    },
    virtual_lines = {
        enabled = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
})

-- for session management
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
