return {
	"neovim/nvim-lspconfig",

	dependencies = {
		-- Use LSP for completion
		"hrsh7th/cmp-nvim-lsp",
		-- File renames take effect everywhere
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
		-- Better LSP for Vim lua files
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {},
		},
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		------------------------------------
		-- Icons
		------------------------------------
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		------------------------------------
		-- Languages
		------------------------------------
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Go
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- Tailwind
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		------------------------------------
		-- Keymaps
		------------------------------------
		local keymap = vim.keymap

		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
		keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
		keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
		keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
	end,
}
