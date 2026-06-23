return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8", -- Recommended
		lazy = false,
		ft = { "rust" },
		opts = {
			server = {
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						-- Add clippy lints for Rust.
						checkOnSave = true,
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
						diagnostics = {
							disabled = { "unresolved-proc-macro", "needless_return", "proc-macro-disabled" },
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = opts
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({
				lsp = {
					enabled = true,
					completion = true,
					actions = true,
				},
			})
		end,
	},
}
