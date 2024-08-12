return {
	"lcroberts/persistent-colorscheme.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		"notken12/base46-colors", -- lots of baked-in themes, view with :Telescope colorscheme
		{
			"folke/tokyonight.nvim",
			opts = {
				style = "night",
			},
		},
	},
	opts = {},
}
