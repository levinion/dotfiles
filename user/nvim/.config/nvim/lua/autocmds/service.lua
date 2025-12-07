vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.service",
	callback = function()
		vim.bo.filetype = "ini"
	end,
})
