local autocmd = vim.api.nvim_create_autocmd({
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
