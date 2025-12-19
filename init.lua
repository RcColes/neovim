require("config.lazy")

-- Copy indentation from the current line when starting a new one
vim.opt.autoindent = true

-- Number of spaces used for each step of (auto)indent
vim.opt.shiftwidth = 4

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Show absolute line numbers
vim.opt.number = true

-- Allow backspace to delete indentation, end-of-line, and text before insert
vim.opt.backspace = { "indent", "eol", "start" }

-- Automatically reload files changed outside of Neovim
vim.opt.autoread = true

-- Automatically write the current buffer when required
vim.opt.autowrite = true

-- Automatically write all modified buffers, not just the current one
vim.opt.autowriteall = true

-- Keep wrapped lines visually indented
vim.opt.breakindent = true

-- Enable filetype detection and filetype-specific plugins
vim.cmd("filetype plugin on")

-- Enable filetype-specific indentation rules
vim.cmd("filetype indent on")

-- Show invisible characters in the buffer
vim.opt.list = true

-- Define how invisible characters are displayed:
--  tab:       shows tabs as ">-"
--  trail:     shows trailing spaces as "~"
--  extends:   shows ">" when a line continues off the screen to the right
--  precedes:  shows "<" when a line continues off the screen to the left
vim.opt.listchars = {
  tab = ">-",
  trail = "~",
  extends = ">",
  precedes = "<",
}

-- Automatically wrap text at 100 characters
-- Commonly used for comments and prose, not hard line breaks
vim.opt.textwidth = 100

-- Time (in tenths of a second) to show matching brackets
-- 2 = 0.2 seconds
vim.opt.matchtime = 2

-- Ignore case when searching
vim.opt.ignorecase = true

-- Override ignorecase if the search pattern contains uppercase letters
vim.opt.smartcase = true

-- Highlight all matches of the last search pattern
vim.opt.hlsearch = true

-- Show search matches incrementally as you type
vim.opt.incsearch = true

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

-- Make `0` jump to the first non-blank character on the line
-- (same behavior as `^`)
vim.keymap.set("n", "0", "^", { noremap = true, silent = true })

-- Do not create backup files
vim.opt.backup = false

-- Do not use a write-backup file while saving
vim.opt.writebackup = false

-- Do not create swap files
vim.opt.swapfile = false

-- Command-line completion:
-- 1) complete to the longest common match
-- 2) then show a list of all matches
vim.opt.wildmode = { "longest", "list" }

-- Enable the enhanced command-line completion menu
vim.opt.wildmenu = true

-- Grep for the word under the cursor using git grep
-- Searches only tracked files in the current Git repository
-- Results are sent to the quickfix list
vim.keymap.set("n", "<C-g>", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("grep " .. vim.fn.shellescape(word))
end, { noremap = true, silent = true })
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "grep",
  callback = function()
    if #vim.fn.getqflist() > 0 then
      vim.cmd("copen")
    end
  end,
})
-- Use git grep for :grep
vim.opt.grepprg = 'git grep -n $* -- :/'
vim.opt.grepformat = "%f:%l:%m"

-- mark columns after 100
local function update_colorcolumn()
  local width = vim.o.columns
  -- Only set color column from 101 up to window width
  if width >= 101 then
    vim.opt.colorcolumn = table.concat(vim.fn.range(101, width), ",")
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
