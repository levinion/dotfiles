-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- Spawn help window vertically
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help,man",
	callback = function()
		vim.cmd("wincmd L")
	end,
})
