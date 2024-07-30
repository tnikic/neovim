return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				-- lua
				"lua_ls",
				-- backend
				"gopls",
				"pyright",
				-- frontend
				"html",
				"cssls",
				"tailwindcss",
				"tsserver",
				-- devops
				"terraformls",
				"dockerls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- lua
				"stylua",
				-- backend
				"goimports",
				"golangci-lint",
				"pylint",
				"isort",
				"black",
				-- frontend
				"prettier",
				"eslint_d",
				-- devops
				"hadolint",
				"tflint",
				"tfsec",
			},
		})
	end,
}
