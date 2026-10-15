return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		-- "e" in lazygit: stash file in parent nvim ($NVIM), quit lazygit, open it in the window lazygit came from
		local pending
		function _G.LazygitOpen(file, line)
			pending = { file = file, line = line }
			return ""
		end
		vim.g.lazygit_on_exit_callback = function()
			if not pending then
				return
			end
			vim.cmd("edit +" .. pending.line .. " " .. vim.fn.fnameescape(pending.file))
			pending = nil
		end
		-- ponytail: filenames containing ' break the vim string, fine in practice
		local cmd = [[nvim --server "$NVIM" --remote-expr "v:lua.LazygitOpen('"{{filename}}"', %s)" && nvim --server "$NVIM" --remote-send q]]
		local overlay = vim.fn.stdpath("cache") .. "/lazygit-nvim.yml"
		vim.fn.writefile({
			"os:",
			"  editPreset: nvim-remote",
			"  edit: |-",
			"    " .. cmd:format("1"),
			"  editAtLine: |-",
			"    " .. cmd:format("{{line}}"),
		}, overlay)
		local main = vim.fn.has("mac") == 1 and vim.fn.expand("~/Library/Application Support/lazygit/config.yml")
			or vim.fn.expand("~/.config/lazygit/config.yml")
		vim.g.lazygit_use_custom_config_file_path = 1
		vim.g.lazygit_config_file_path = { main, overlay }
	end,
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
