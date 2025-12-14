require("config.lazy")


-- Spellchecking
vim.opt.spell=true
vim.opt.spelllang = { "en_us" }

-- Typewriter mode
vim.opt.scrolloff=100

-- Use system clipboard for all operations
vim.opt.clipboard = "unnamedplus"

-- Highlight current line
vim.opt.cursorline=true

-- Don't wrap
vim.opt.wrap=false

-- mark columns after 100
local function update_colorcolumn()
  local width = vim.o.columns
  -- Only set color column from 81 up to window width
  if width >= 101 then
    vim.opt.colorcolumn = table.concat(vim.fn.range(81, width), ",")
  else
    vim.opt.colorcolumn = ""
  end
end

-- Update on Vim startup
update_colorcolumn()

-- Update whenever window is resized
vim.api.nvim_create_autocmd("VimResized", {
  callback = update_colorcolumn
})

-- Window navigation with Alt/Option + arrows
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, remap = false })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
-- also work in terminal mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true })
