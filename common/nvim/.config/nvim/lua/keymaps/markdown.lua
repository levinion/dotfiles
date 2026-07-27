vim.keymap.set("n", "<leader>mb", function()
	local peek = require("peek")
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { desc = "Toggle markview view in browser" })
