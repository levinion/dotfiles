return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"stylua",
				"lua-language-server",
				-- bash
				"shfmt",
				"bash-language-server",
				-- python
				"ruff",
				"ty",
				-- go
				"gofumpt",
				"goimports",
				"gopls",
				-- config
				"json-lsp",
				"jsonlint",
				"yaml-language-server",
				"taplo",
				-- frontend
				"css-lsp",
				"prettier",
				"vtsls",
				"tailwindcss-language-server",
				-- c/cpp
				"clangd",
				"cmakelang",
				"cmakelint",
				"neocmakelsp",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- inline hint
			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = true,
				underline = true,
				severity_sort = true,
				-- diagnostic icons
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			})

			-- enable inlay_hint for all buffers
			vim.lsp.inlay_hint.enable(true)

			-- keymaps
			vim.keymap.set("n", "<leader>cl", function()
				vim.cmd("checkhealth vim.lsp")
			end, { desc = "Lsp Info" })
			vim.keymap.set("n", "<leader>cd", function()
				vim.diagnostic.open_float()
			end, { desc = "Code diagnostic" })
			vim.keymap.set(
				"n",
				"<leader>ch",
				"<cmd>LspClangdSwitchSourceHeader<cr>",
				{ desc = "Switch Source/Header (C/C++)" }
			)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

			-- diagnostic
			local diagnostic_goto = function(next, severity)
				severity = severity and vim.diagnostic.severity[severity] or nil
				return function()
					vim.diagnostic.jump({ count = next and 1 or -1, severity = severity })
				end
			end

			vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
			vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
			vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
			vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
			vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
			vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

			-- load lang config
			require("utils").require_all("lang")
		end,
	},
}
