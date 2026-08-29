vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

vim.g.autoformat = true

require("conform").setup({
	format_on_save = function(bufnr)
		if vim.g.autoformat then
			local disable_filetypes = {}
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		else
			return
		end
	end,
})

local function setup_format_toggle()
	if _G.Snacks and Snacks.toggle then
		Snacks.toggle
			.new({
				id = "Format on Save",
				name = "Format on Save",
				get = function()
					return vim.g.autoformat
				end,
				set = function(_)
					vim.g.autoformat = not vim.g.autoformat
				end,
			})
			:map("<leader>cf")
	end
end

if _G.Snacks then
	setup_format_toggle()
else
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		once = true,
		callback = setup_format_toggle,
	})
end
