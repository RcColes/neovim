return {
  "johnseth97/codex.nvim",
  cmd = { "Codex", "CodexToggle" },
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    vim.keymap.set(
      { "n", "i", "v", "t" },
      "<C-q>",
      "<cmd>CodexToggle<CR>",
      { noremap = true, silent = true }
    )
  end,
  config = function()
    require("codex").setup({
      inline = { enabled = true },
    })
  end,
}
