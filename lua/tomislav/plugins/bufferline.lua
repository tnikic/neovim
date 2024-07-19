return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		highlights = {
			fill = {
				bg = {
					attribute = "bg",
					highlight = "Pmenu",
				},
			},
		},
		options = {
			mode = "tabs",
			diagnostics = "nvim-lsp",
		},
	},
}
