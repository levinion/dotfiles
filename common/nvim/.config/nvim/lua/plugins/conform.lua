return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = function()
			return {
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
			}
		end,
	},
	{ -- Assuming you init/setup snacks.nvim in a different file
		"folke/snacks.nvim",
		opts = function()
			vim.g.autoformat = true -- Sets up the default value to be true

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
		end,
	},
}
