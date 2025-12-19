return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit" },  -- lazy-load when running Git commands
  keys = {
    { "<leader>gs", ":Git<CR>", desc = "Git status" },
    { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
    { "<leader>gp", ":Git push<CR>", desc = "Git push" },
    { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
  },
  config = function()
    -- Optional: additional settings for fugitive
    -- For example, automatically open vertical diffs in split
    vim.g.fugitive_legacy_commands = 0
  end,
}
