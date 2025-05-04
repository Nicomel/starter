require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" , "pyright", "tsserver", "rust_analyzer"}
vim.lsp.enable(servers)
