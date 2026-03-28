return {
  "akinsho/toggleterm.nvim",
  opts = {
    direction = "float",
    share_terminals = true,
    float_opts = {
      border = "curved",
    },
  },
  keys = {
    {
      "<C-\\>",
      "<cmd>ToggleTerm<cr>",
      desc = "Toggle terminal",
      mode = { "n", "t" },
    },
    {
      "<C-_>",
      function()
        local root = require("lazyvim.util").root()
        vim.cmd("TermNew dir=" .. vim.fn.fnameescape(root))
      end,
      desc = "New terminal (root)",
      mode = { "n", "t" },
    },
    {
      "<leader>ft",
      "<cmd>TermSelect<cr>",
      desc = "Term select",
      mode = { "n", "t" },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Set terminal-specific keymaps when a terminal opens
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local _opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], _opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], _opts)
        vim.keymap.set("t", "<C-h>", [[<cmd>wincmd h<cr>]], _opts)
        vim.keymap.set("t", "<C-j>", [[<cmd>wincmd j<cr>]], _opts)
        vim.keymap.set("t", "<C-k>", [[<cmd>wincmd k<cr>]], _opts)
        vim.keymap.set("t", "<C-l>", [[<cmd>wincmd l<cr>]], _opts)
      end,
    })
  end,
}
