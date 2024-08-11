return {
	-- Requires ctags installed and on your PATH
	-- https://github.com/universal-ctags/ctags
	"preservim/tagbar",
	lazy = false,
	init = function()
		vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle<CR>", { noremap = true, silent = true })
	end,
}
