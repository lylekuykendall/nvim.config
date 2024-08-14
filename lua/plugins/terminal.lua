return {
	"NvChad/nvterm",
	config = function()
		-- Mappings
		vim.keymap.set("n", "<A-h>", function()
			require("nvterm.terminal").toggle("horizontal")
		end, { desc = "Toggle horizontal terminal" })
		vim.keymap.set("t", "<A-h>", function()
			require("nvterm.terminal").toggle("horizontal")
		end, { desc = "Toggle horizontal terminal" })
		vim.keymap.set("n", "<A-v>", function()
			require("nvterm.terminal").toggle("vertical")
		end, { desc = "Toggle vertical terminal" })
		vim.keymap.set("t", "<A-v>", function()
			require("nvterm.terminal").toggle("vertical")
		end, { desc = "Toggle vertical terminal" })
		vim.keymap.set("n", "<A-.>", function()
			require("nvterm.terminal").toggle("float")
		end, { desc = "Toggle floating terminal" })
		vim.keymap.set("t", "<A-.>", function()
			require("nvterm.terminal").toggle("float")
		end, { desc = "Toggle floating terminal" })

		require("nvterm").setup()
	end,
}
