vim.api.nvim_create_autocmd({
	"BufRead",
	"BufNewFile",
}, {
	pattern = {
		"*/.config/systemd/user/*.d/.#*",
		"*/etc/systemd/system/*.d/.#*",
		"*/.config/systemd/user/.#*",
		"*/etc/systemd/system/.#*",
		"*/var/tmp/*.service",
	},
	callback = function()
		vim.bo.filetype = "systemd"
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})
