-- Switch to English while esc pressed. (only for fcitx5)
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = { "*" },
	callback = function()
		local input_status = tonumber(vim.fn.system("fcitx5-remote"))
		if input_status == 2 then
			vim.fn.system("fcitx5-remote -c")
		end
	end,
})
