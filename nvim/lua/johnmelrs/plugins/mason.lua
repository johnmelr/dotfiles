return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({})

    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "cssls",
        "tailwindcss",
        "html",
        "eslint",
        "kotlin_language_server",
        "ast_grep",
        "texlab",
        "lua_ls",
        "grammarly",
        "pyright",
        "rust_analyzer",
      },
      automatic_installation = true,
    })
  end
}
