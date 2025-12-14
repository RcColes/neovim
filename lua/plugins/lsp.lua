return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Optional: setup cmp capabilities if using nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if cmp_ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Function to attach keymaps when LSP attaches
    local on_attach = function(client, bufnr)
      local bufmap = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
      end

      -- LSP keymaps
      --bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      --bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
      --bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
      --bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
      --bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
      --bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
    end

    -- =========================
    -- C / C++
    -- =========================
    vim.lsp.config('clangd', {
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- =========================
    -- Rust
    -- =========================
    vim.lsp.config('rust_analyzer', {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- =========================
    -- Python
    -- =========================
    vim.lsp.config('pyright', {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- =========================
    -- CMake
    -- =========================
    vim.lsp.config('cmake', {
      cmd = { "cmake-language-server" },
      filetypes = { "cmake" },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- =========================
    -- Lua (Neovim config)
    -- =========================
    vim.lsp.config('lua_ls', {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT", -- Neovim uses LuaJIT
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" }, -- recognize `vim` global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- make Neovim runtime files visible
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
