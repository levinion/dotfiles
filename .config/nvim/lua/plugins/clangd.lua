local clangd = "clangd"

-- if os.getenv("IDF_PATH") then
--   clangd = vim.fn.expand("$HOME/.espressif/tools/esp-clang/esp-*/esp-clang/bin/clangd")
-- end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        cmd = {
          clangd,
          "--clang-tidy",
          "--all-scopes-completion",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--pch-storage=disk",
          "--log=error",
          "--j=12",
          "--background-index",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=**",
          "--suggest-missing-includes",
          "--cross-file-rename",
          "--header-insertion-decorators",
        },
        init_options = {
          compilationDatabasePath = "./build",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      },
    },
  },
}
