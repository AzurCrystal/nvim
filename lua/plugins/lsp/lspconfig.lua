return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		-- Rust Analyzer
		lspconfig.rust_analyzer.setup({})
		-- C
		lspconfig.ccls.setup({
			init_options = {
				compilationDatabaseDirectory = "build",
				index = {
					threads = 0,
				},
				clang = {
					excludeArgs = { "-frounding-math" },
				},
			},
		})
		-- Markdown
		lspconfig.marksman.setup({})
		-- json
		lspconfig.jsonls.setup({})
		-- bash
		lspconfig.bashls.setup({})
		-- Python
		lspconfig.csharp_ls.setup({})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
		end

		lspconfig.ruff_lsp.setup({

			on_attach = on_attach,
			init_options = {
				settings = {
					-- Any extra CLI arguments for `ruff` go here.
					args = {},
				},
			},
		})
	end,
}
