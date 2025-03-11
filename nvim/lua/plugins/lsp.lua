return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        glsl_analyzer = {},
      },
    },
  },
}
