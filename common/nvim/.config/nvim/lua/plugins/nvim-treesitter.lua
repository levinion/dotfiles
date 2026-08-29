vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/neovim-treesitter/treesitter-parser-registry" },
})

local ensure_installed = {
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
}

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = ensure_installed,
	callback = function()
		pcall(vim.treesitter.start)
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
