return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = function(_, opts)
    -- Use system pyright (pip/conda) when Mason hasn't installed it (e.g., k8s pods).
    -- On the laptop where Mason manages pyright, this leaves mason enabled as default.
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver"
    local mason_has_pyright = vim.uv.fs_stat(mason_bin) ~= nil

    opts.servers = opts.servers or {}
    opts.servers.pyright = vim.tbl_deep_extend("force", opts.servers.pyright or {}, {
      mason = mason_has_pyright,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            typeCheckingMode = "off",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    return opts
  end,
}
