return {
  "arcticicestudio/nord-vim",
  lazy = false, -- load immediately on startup
  priority = 1000, -- ensures colorscheme loads early
  config = function()
    -- Apply the colorscheme
    vim.cmd("colorscheme nord")
  end,
}
