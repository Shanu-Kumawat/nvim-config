-- Better terminal integration for Neovim
require("betterTerm").setup {
  -- Configuration options
  position = "bot", -- Position of the terminal: "bot", "top", "left", "right"
  size = 20, -- Size of the terminal window
}

-- Keymaps for betterTerm
local betterTerm = require "betterTerm"

-- toggle terminal
vim.keymap.set({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
-- toggle terminal 2
vim.keymap.set({ "n", "t" }, "<C-'>", function()
  betterTerm.open(1)
end, { desc = "Open terminal 2" })

-- Select term focus
vim.keymap.set({ "n" }, "<leader>tt", betterTerm.select, { desc = "Select terminal" })

-- Create new term
local current = 2
vim.keymap.set({ "n" }, "<leader>tn", function()
  betterTerm.open(current)
  current = current + 1
end, { desc = "New terminal" })
