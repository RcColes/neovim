return {
  "neovim/nvim-lspconfig",
  config = function()
    -- optional: setup cmp capabilities if using nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if cmp_ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- function to attach keymaps when lsp attaches
    local on_attach = function(client, bufnr)
      local bufmap = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
      end
    end

    vim.lsp.virtual_text=true
    vim.lsp.enable('clangd')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('pyright')
    vim.lsp.enable('cmake')

    vim.o.updatetime = 250
    
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
      end,
    })

    vim.keymap.set("n", "<MouseMove>", function()
        vim.diagnostic.open_float(nil, { focus = false })
    end)

    vim.diagnostic.config({
      float = { border = "rounded" },
    })
  end,
}
