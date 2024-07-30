return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- basics
				lua = { "stylua" },
				markdown = { "prettier" },
				-- datatypes
				json = { "prettier" },
				yaml = { "prettier" },
				-- backend
				go = { "goimports" },
				python = { "isort", "black" },
				-- frontend
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
