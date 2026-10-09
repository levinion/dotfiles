vim.lsp.config("biome", {
  filetypes = {
    "css",
    "graphql",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescriptreact",
  },
  -- Also support standalone files and projects without a Biome config.
  workspace_required = false,
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    if path == "" then return end
    local dir = vim.fs.dirname(path)
    on_dir(vim.fs.root(dir, { "biome.json", "biome.jsonc", ".git" }) or dir)
  end,
  settings = { require_configuration = false },
})

vim.lsp.enable("biome")
