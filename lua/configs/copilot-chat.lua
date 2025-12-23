return {
  Rename = {
    prompt = "Please rename the variable correctly in given selection based on context",
    selection = function(source)
      local select = require "CopilotChat.select"
      return select.visual(source)
    end,
  },
  -- Core configuration
  debug = false, -- Enable debug logging
  proxy = nil, -- Configure proxy for GitHub API requests
  allow_insecure = false, -- Allow insecure server connections

  -- UI customization
  -- window = {
  --   layout = "float", -- 'float' | 'bottom' | 'right' | 'top' | 'left'
  --   relative = "editor", -- 'editor' | 'win' | 'cursor'
  --   width = 0.8, -- fractional width for float windows
  --   height = 0.8, -- fractional height for float windows
  --   border = "rounded", -- 'none' | 'single' | 'double' | 'rounded' | 'solid' | 'shadow'
  --   zindex = 50, -- determines stack order for floating windows
  -- },

  -- Prompt customization
  -- prompts = {},

  -- Optional GitHub Copilot Enterprise configuration
  -- enterprise = {
  --   org = "your-organization",
  --   team = "your-team",
  --   api_key = nil, -- Will use the value from $GITHUB_COPILOT_ENTERPRISE_API_KEY environment variable by default
  -- },

  -- Keymaps in the chat window
  -- mappings = {
  --   close = {
  --     normal = "q",
  --     insert = "<C-c>",
  --   },
  --   reset = {
  --     normal = "<C-l>",
  --     insert = "<C-l>",
  --   },
  --   submit_prompt = {
  --     normal = "<CR>",
  --     insert = "<C-CR>",
  --   },
  --   accept_diff = {
  --     normal = "<C-y>",
  --     insert = "<C-y>",
  --   },
  --   show_diff = {
  --     normal = "gd",
  --   },
  --   show_system_prompt = {
  --     normal = "gp",
  --   },
  --   cycle_windows = {
  --     normal = "<Tab>",
  --     insert = "<C-Tab>",
  --   },
  -- },
}

-- Define global keymaps for quick access
-- vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "CopilotChat - Open" })
-- vim.keymap.set("n", "<leader>cf", "<cmd>CopilotChatFixCode<CR>", { desc = "CopilotChat - Fix code" })
-- vim.keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
-- vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
-- vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
-- vim.keymap.set("n", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "CopilotChat - Generate docs" })
-- vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatRefactor<CR>", { desc = "CopilotChat - Refactor code" })
--
-- -- Visual mode keymaps for working with selections
-- vim.keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "CopilotChat - Explain selected code" })
-- vim.keymap.set("v", "<leader>cf", ":CopilotChatFixCode<CR>", { desc = "CopilotChat - Fix selected code" })
-- vim.keymap.set("v", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize selected code" })
--
-- -- Quick action for selected code (ask anything about selection)
-- vim.keymap.set("v", "<leader>ca", ":CopilotChatVisual ", { desc = "CopilotChat - Ask about selection" })
--
-- -- Show custom help for buffer under cursor
-- vim.keymap.set("n", "<leader>ch", "<cmd>CopilotChatBuffer<CR>", { desc = "CopilotChat - Help with buffer" })
