return {
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = { "BufReadPre", "BufNewFile" },
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
}
