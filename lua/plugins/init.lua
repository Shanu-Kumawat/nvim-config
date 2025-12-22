return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Core
        "bash",
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",

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
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      require("configs.markdown-preview").setup()
    end,
    ft = { "markdown" },
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    build = "make tiktoken", -- Only on MacOS or Linux
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
      { "<Leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
      { "<Leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
      { "<Leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
      { "<Leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
      { "<Leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
      { "<leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate Commit for Selection" },
    },
    opts = {
      Rename = {
        prompt = "Please rename the variable correctly in given selection based on context",
        selection = function(source)
          local select = require "CopilotChat.select"
          return select.visual(source)
        end,
      },
    },
  },

  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.elixir-tools"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/which-key.nvim",
    lazy = false, -- disables lazy loading
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  {
    "CRAG666/betterTerm.nvim",
    lazy = false,
    config = function()
      require "configs.betterterm"
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.code-runner"
    end,
  },

  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require "configs.flutter-tools"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
