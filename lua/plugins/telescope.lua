-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"andrew-george/telescope-themes",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				-- extensions = {
				--   ['ui-select'] = {
				--     require('telescope.themes').get_dropdown(),
				--   },
				-- },
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			-- Keymaps with leader key
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set(
				"n",
				"<leader>sf",
				"<CMD> Telescope find_files follow=true <CR>",
				{ desc = "[S]earch [F]iles" }
			)
			vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "[S]earch Telescope [B]uilt-ins" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sR", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader>sc", builtin.git_commits, { desc = "[S]earch Git [C]ommits" })
			vim.keymap.set("n", "<leader>ss", builtin.git_status, { desc = "[S]earch Git [S]tatus" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Same keymaps, without leader
			vim.keymap.set("n", "fh", builtin.help_tags, { desc = "[F]ind in [H]elp" })
			vim.keymap.set("n", "fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
			vim.keymap.set("n", "ff", "<CMD> Telescope find_files follow=true <CR>", { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "fb", builtin.builtin, { desc = "[F]ind Telescope [B]uilt-Ins" })
			vim.keymap.set("n", "fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
			vim.keymap.set("n", "fg", builtin.live_grep, { desc = "[F]ind with [G]rep" })
			vim.keymap.set("n", "fd", builtin.diagnostics, { desc = "[F]ind in [D]iagnostics" })
			vim.keymap.set("n", "fR", builtin.resume, { desc = "[F]ind [R]esume" })
			vim.keymap.set("n", "fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
			vim.keymap.set("n", "fc", builtin.git_commits, { desc = "[F]ind Git [C]ommits" })
			vim.keymap.set("n", "fs", builtin.git_status, { desc = "[F]ind Git [S]tatus" })
			vim.keymap.set("n", "f<space>", builtin.buffers, { desc = "[F]ind existing buffers" })

			-- Colorscheme picker
			vim.keymap.set("n", "<leader>tc", builtin.colorscheme, { desc = "[T]elescope [C]olorscheme Picker" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>.", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[.] Fuzzily search in current buffer" })
			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "f.", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[.] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s.", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [.] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
			vim.keymap.set("n", "fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind [N]eovim Files" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
