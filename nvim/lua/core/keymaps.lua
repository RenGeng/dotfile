-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h><C-g>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l><C-g>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j><C-g>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k><C-g>", { desc = "Move focus to the upper window" })
-- vim.keymap.set("n", "<C-H>", "<Cmd>5wincmd<LT><CR>", {desc="Increase focused window on left"})
-- vim.keymap.set("n", "<C-J>", "<Cmd>5wincmd-<CR>", {desc="Increase focused window on down"})
-- vim.keymap.set("n", "<C-L>", "<Cmd>5wincmd><CR>", {desc="Increase focused window on right"})
-- vim.keymap.set("n", "<C-K>", "<Cmd>5wincmd+<CR>", {desc="Increase focused window on up"})

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- window management
-- vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split [W]indow [V]ertically" })               -- split window vertically
vim.keymap.set("n", "<leader>wv",
    function()
        vim.cmd('vsplit')
        require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
    end, { desc = "Split [W]indow [V]ertically and Find Files" })

vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split [W]indow [H]orizontally" })             -- split window horizontally
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true }) -- disable adding changed word into clipboard
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true }) -- disable adding changed word into clipboard

vim.api.nvim_set_keymap('v', 'p', '"_dP', { silent = true })
vim.api.nvim_set_keymap('v', 'y', 'y`]', { silent = true })

vim.api.nvim_set_keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "n", 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", 'Nzz', { noremap = true, silent = true })

-- Spectre keymapping for substitute
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word",
})
vim.keymap.set("v", "<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word",
})
vim.keymap.set("n", "<leader>Sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})



-- Rainbow CSV keymap
vim.keymap.set("n", "<leader>csv", "<cmd>RainbowDelim<CR>", { desc = "Enable Rainbow CSV" })
vim.keymap.set("n", "<leader>csva", "<cmd>RainbowAlign<CR>", { desc = "Rainbow CSV Align" })
vim.keymap.set("n", "<leader>csvs", "<cmd>RainbowShrink<CR>", { desc = "Rainbow CSV Shrink" })

-- dbt: jump to compiled version of current file
vim.keymap.set("n", "gC", function()
    local path = vim.fn.expand("%:p")
    local compiled, n = path:gsub("/dbt/", "/dbt/target/compiled/ucr/", 1)
    if n == 0 then
        vim.notify("Not inside a dbt/ folder", vim.log.levels.WARN)
        return
    end
    if vim.fn.filereadable(compiled) == 0 then
        vim.notify("Compiled file not found: " .. compiled, vim.log.levels.WARN)
        return
    end
    vim.cmd("edit " .. vim.fn.fnameescape(compiled))
end, { desc = "[G]o to dbt [C]ompiled file" })

-- dbt: jump to compiled version of file under cursor
-- vim.keymap.set("n", "gC", function()
--     local token = vim.fn.expand("<cfile>")
--     if token == nil or token == "" then
--         token = vim.fn.expand("<cword>")
--     end
--     if token == nil or token == "" then
--         vim.notify("No file/word under cursor", vim.log.levels.WARN)
--         return
--     end
--
--     -- strip extension if user already had one, then force .sql
--     local name = token:gsub("%.sql$", ""):gsub("%.SQL$", "")
--     local needle = name .. ".sql"
--
--     -- find dbt root by walking up from cwd looking for a dbt/ dir
--     local root = vim.fs.find({ "dbt" }, { upward = true, type = "directory", path = vim.fn.getcwd() })[1]
--     if root == nil then
--         -- fallback: assume cwd is dbt project root
--         root = vim.fn.getcwd() .. "/dbt"
--     end
--     local search_dir = root .. "/target/compiled/ucr"
--     if vim.fn.isdirectory(search_dir) == 0 then
--         vim.notify("Compiled dir not found: " .. search_dir, vim.log.levels.WARN)
--         return
--     end
--
--     local matches = vim.fs.find(needle, { path = search_dir, type = "file", limit = 50 })
--     if #matches == 0 then
--         vim.notify("No compiled file matching: " .. needle, vim.log.levels.WARN)
--         return
--     end
--     if #matches == 1 then
--         vim.cmd("edit " .. vim.fn.fnameescape(matches[1]))
--         return
--     end
--     vim.ui.select(matches, { prompt = "Compiled file:" }, function(choice)
--         if choice then vim.cmd("edit " .. vim.fn.fnameescape(choice)) end
--     end)
-- end, { desc = "[G]o to dbt [C]ompiled file under cursor" })
