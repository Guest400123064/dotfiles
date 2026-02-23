return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
