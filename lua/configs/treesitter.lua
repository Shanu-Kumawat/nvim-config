local options = {
  ensure_installed = {
    -- Core
    "bash",
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",

    -- Go
    "go",
    "gomod",
    "gowork",
    "gosum",
    "gotmpl",

    -- Web
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",

    -- Docs & config
    "markdown",
    "markdown_inline",
    "yaml",
    "toml",

    -- Programming
    "python",
    "rust",

    -- System
    "nix",
    "hyprlang",

    -- Infra
    "dockerfile",
    "nginx",
    "sql",

    -- Internals
    "query",
    "printf",
    "luadoc",

    -- Elixir
    "elixir",
    "heex",
    "eex",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-o>",
      node_incremental = "<A-o>",
      scope_incremental = false,
      node_decremental = "<A-i>",
    },
  },
}

return options
