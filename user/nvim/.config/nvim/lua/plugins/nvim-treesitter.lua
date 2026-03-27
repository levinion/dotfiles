return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"diff",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"javascript",
			"jsdoc",
			"html",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"json",
			"toml",
			"xml",
			"yaml",
			"ini",
			"c",
			"cpp",
			"rust",
			"ron",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"ninja",
			"rst",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup({})
		require("nvim-treesitter").install(opts.ensure_installed)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = opts.ensure_installed,
			callback = function()
				-- enable highlighting
				vim.treesitter.start()
				-- enable folds
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				-- enable indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
