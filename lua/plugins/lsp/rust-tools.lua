return {
	"simrat39/rust-tools.nvim",
	lazy = true,
	event = { "BufReadPre *.rs" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local rt = require("rust-tools")
		local opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		}
		rt.setup(opts)
	end,
}
