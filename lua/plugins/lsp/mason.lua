return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end,
}, {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"marksman",
				"jsonls",
				"bashls",
				"ansiblels",
				"gopls",
				"ruff_lsp",
				"taplo",
				"typst_lsp",
				"yamlls",
			},
		}
		require("mason-lspconfig").setup(opts)
	end,
}
