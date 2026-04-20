require("nvchad.configs.lspconfig").defaults()

local servers = { "cssls", "nixd", "clangd", "taplo" }
local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- configuring single server, example: typescript
-- vim.lsp.config("ts_ls", {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })
-- vim.lsp.enable "ts_ls"

-- go LSP
vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
    },
  },
})
vim.lsp.enable "gopls"

-- Python LSPs
local python_servers = { "pyright", "ruff" }
for _, sp in ipairs(python_servers) do
  vim.lsp.config(sp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  })
  vim.lsp.enable(sp)
end

-- Web LSPs
vim.lsp.config("html", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "heex" },
})
vim.lsp.enable("html")

vim.lsp.config("ts_ls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable("ts_ls")

vim.lsp.config("tailwindcss", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "html", "css", "scss", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "vue", "svelte", "heex", "elixir", "eelixir",
  },
  root_dir = function(fname)
    local util = require "lspconfig.util"
    return util.root_pattern("tailwind.config.js", "tailwind.config.ts", "assets/css/app.css", "mix.exs")(fname)
  end,
  init_options = {
    userLanguages = { elixir = "html-eex", eelixir = "html-eex", heex = "html-eex" },
  },
  settings = {
    tailwindCSS = {
      includeLanguages = { elixir = "html", eelixir = "html", heex = "html" },
      experimental = {
        classRegex = {
          [[class: "([^"]*)]],
          [[class: '([^']*)]],
          '~H""".*class="([^"]*)".*"""',
          [[class="([^"]*)]],
        },
      },
      validate = true,
    },
  },
})
vim.lsp.enable("tailwindcss")

vim.lsp.config("emmet_language_server", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescript", "typescriptreact", "heex",
  },
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
  },
})
vim.lsp.enable("emmet_language_server")

-- Elixir LSP (expert)
vim.lsp.config("expert", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "expert", "--stdio" },
  root_markers = { "mix.exs", ".git" },
  filetypes = { "elixir", "eelixir", "heex" },
})
vim.lsp.enable("expert")
