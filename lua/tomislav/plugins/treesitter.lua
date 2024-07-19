return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			modules = {},
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = false,
			ignore_install = {},
			ensure_installed = {
				-- vim
				"vimdoc",
				"luadoc",
				"vim",
				"lua",
				"markdown",
				"regex",
				-- golang
				"go",
				-- frontend
				"html",
				"css",
			},
		})
	end,
}
