vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "make" then
			vim.o.expandtab = false
		end
	end,
})
