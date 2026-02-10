return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
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
    opts = function()
      return require "configs.copilot-chat"
    end,
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

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup(require "configs.surround")
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = require "configs.todo",
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "configs.trouble",
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = require "configs.flash",
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require "configs.oil"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.harpoon"
    end,
  },
}
