local map = vim.keymap.set
local bufnr = vim.api.nvim_get_current_buf()

-- Markdown Preview
map("n", "<leader>mp", "<Plug>MarkdownPreview", { buffer = bufnr, desc = "Markdown preview start" })
map("n", "<leader>ms", "<Plug>MarkdownPreviewStop", { buffer = bufnr, desc = "Markdown preview stop" })
map("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", { buffer = bufnr, desc = "Markdown preview toggle" })
