return {
  "ctrlpvim/ctrlp.vim",
  cmd = { "CtrlP", "CtrlPMRU", "CtrlPBuffer" }, -- lazy-load when commands are used
  init = function()
    -- CtrlP globals
    vim.g.ctrlp_follow_symlinks = 1
    vim.g.ctrlp_open_multiple_files = "2hjr"
    vim.g.ctrlp_root_markers = { ".git" }
    vim.g.ctrlp_match_window = "bottom,order:ttb,min:1,max:20,results:30"
    vim.g.ctrlp_custom_ignore = "node_modules\\|.DS_Store\\|.git\\|cmake_.*"
    vim.g.ctrlp_regexp = 1
    vim.g.ctrlp_use_caching = 1

    -- Always-available keymaps
    vim.keymap.set({ "n", "i", "t" }, "<C-p>", "<cmd>CtrlP<CR>", { noremap = true, silent = true })
    vim.keymap.set({ "n", "i", "t" }, "<C-b>", "<cmd>CtrlPBuffer<CR>", { noremap = true, silent = true })

    vim.g.ctrlp_user_command = {
      "git ls-files",
    }
    vim.g.ctrlp_working_path_mode = "r"
    vim.g.ctrlp_show_hidden = 0
  end,
}
