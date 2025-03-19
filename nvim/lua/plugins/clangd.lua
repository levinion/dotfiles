local clangd = "clangd"

if os.getenv("IDF_PATH") then
  clangd = "/home/maruka/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clangd"
end

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
          "--j=5",
          "--background-index",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          compilationDatabasePath = "./build",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      },
    },
  },
}
