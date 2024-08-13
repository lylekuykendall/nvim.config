return {
	"olexsmir/gopher.nvim",
	ft = "go",
	config = function(_, opts)
		require("gopher").setup({
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "gotests",
				impl = "impl",
				iferr = ":wqferr",
			},
			gotests = {
				-- gotests doesn't have template named "default" so this plugin uses "default" to set the default template
				template = "default",
				-- path to a directory containing custom test code templates
				template_dir = nil,
				-- switch table tests from using slice to map (with test name for the key)
				-- works only with gotests installed from develop branch
				named = false,
			},
			gotag = {
				transform = "snakecase",
			},
		})

		local gopher = require("gopher")
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.softtabstop = 4

		vim.keymap.set("n", "<leader>gsj", "<CMD> GoTagAdd json <CR>", { desc = "Add json struct tags" })
		vim.keymap.set("n", "<leader>gsy", "<CMD> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })
		vim.keymap.set("n", "<leader>gsb", "<CMD> GoTagAdd proto <CR>", { desc = "Add proto struct tags" })
		vim.keymap.set("n", "<leader>gmt", "<CMD> GoMod tidy <CR>", { desc = "Run go mod tidy" })
		vim.keymap.set("n", "<leader>gt", gopher.test.add, { desc = "Generate test for function/method under cursor" })
		vim.keymap.set(
			"n",
			"<leader>gT",
			gopher.test.all,
			{ desc = "Generate tests for all functions/methods in current file" }
		)
		vim.keymap.set(
			"n",
			"<leader>ge",
			gopher.test.exported,
			{ desc = "Generate tests only for exported function/methods in current file" }
		)
		vim.keymap.set("n", "<leader>gp", "<CMD> GoGenerate <CR>", { desc = "Run go generate in pwd" })
		vim.keymap.set("n", "<leader>gf", "<CMD> GoGenerate % <CR>", { desc = "Run go generate for current file" })
		vim.keymap.set(
			"n",
			"<leader>gc",
			"<CMD> GoCmt <CR>",
			{ desc = "Generate doc comment for public package/function/interface/struct under cursor" }
		)
		vim.keymap.set("n", "<leader>gie", "<CMD> GoIfErr <CR>", { desc = "Generate if err on current line" })
		vim.keymap.set("n", "<leader>gii", "<CMD> GoImpl ", { desc = "Implement interface" })
		vim.keymap.set("n", "<leader>gge", "<CMD> GoGet ", { desc = "Go get" })
	end,
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	---@type gopher.Config
	opts = {},
}
