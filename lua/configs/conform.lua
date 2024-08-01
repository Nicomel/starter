local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { { "ruff_fix", "isort"}, { "ruff_format", "black" } },
    -- css = { "prettier" },
    -- html = { "prettier" },
    ["_"] = { "trim_newlines", "trim_whitespace" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
