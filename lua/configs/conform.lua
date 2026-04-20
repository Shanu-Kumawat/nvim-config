local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    cpp = { "clang-format" },
    go = { "gofumpt", "goimports_reviser", "golines" },
    python = { "black" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd", "djlint" },
    markdown = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    elixir = { "mix" },
    eelixir = { "mix" },
    heex = { "mix" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
