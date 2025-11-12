vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "zsh" then
			vim.bo.filetype = "bash"
		end
	end,
})
