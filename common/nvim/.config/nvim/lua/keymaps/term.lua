vim.keymap.set("n", "<C-_>", function()
	local dir = vim.fn.expand("%:p:h")
	vim.fn.jobstart({ "foot", "-D", dir, "tmux", "new-session", "-c", dir }, { detach = true })
end, { desc = "Open foot in current buffer directory" })
