require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- =============================================================================
--  General Editing
-- =============================================================================

-- Move selected text up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- Join lines but keep cursor position
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Insert empty lines without entering insert mode
vim.keymap.set("n", "<leader>o", function()
  local count = vim.v.count1
  local current_line = vim.fn.line "."
  local lines = {}
  for _ = 1, count do
    table.insert(lines, "")
  end
  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, lines)
end, { desc = "Insert empty line(s) below" })

vim.keymap.set("n", "<leader>O", function()
  local count = vim.v.count1
  local current_line = vim.fn.line "."
  local lines = {}
  for _ = 1, count do
    table.insert(lines, "")
  end
  vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, lines)
end, { desc = "Insert empty line(s) above" })

-- "Greatest remap ever" - Paste without losing register
map("x", "<leader>p", [["_dP]], { desc = "Delete and paste" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Permanent delete" })

-- =============================================================================
--  Navigation
-- =============================================================================

-- Center cursor when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Half page scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page scroll up" })

-- Center cursor when searching
map("n", "n", "nzzzv", { desc = "Next search result and center cursor" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center cursor" })

-- =============================================================================
--  Buffer Management
-- =============================================================================

for i = 1, 9, 1 do
  map("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = "Switch to buffer " .. i })
end

-- =============================================================================
--  LSP & Diagnostics
-- =============================================================================

-- LSP Navigation
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- LSP Actions
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
map("n", "<leader>K", vim.lsp.buf.hover, { desc = "Show hover" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>ra", function()
  require("nvchad.lsp.renamer")()
end, { desc = "NvRenamer" })

-- Workspace Folders
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })

-- Diagnostics & Quickfix
nomap("n", "<leader>ds") -- move to diagnostic list
nomap("n", "<leader>e")

map("n", "<leader>qe", function()
  vim.diagnostic.setqflist { open = false }
end, { desc = "Set quickfix list with diagnostics (Error Quickfix)" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Quickfix & Location List Navigation
map("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "[q", ":cprev<CR>zz", { desc = "Previous quickfix item" })
map("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
map("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })

map("n", "]l", ":lnext<CR>zz", { desc = "Next location list item" })
map("n", "[l", ":lprev<CR>zz", { desc = "Previous location list item" })
map("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
map("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })

-- =============================================================================
--  Plugins
-- =============================================================================

-- BetterTerm
nomap("n", "<leader>h") -- Remove default horizontal term map
map({ "n", "t" }, "<C-;>", function()
  require("betterTerm").open()
end, { desc = "Open terminal" })
map({ "n", "t" }, "<C-'>", function()
  require("betterTerm").open(1)
end, { desc = "Open terminal 2" })
map("n", "<leader>tt", function()
  require("betterTerm").select()
end, { desc = "Select terminal" })

-- Code Runner
map("n", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = false, desc = "Run Code" })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false, desc = "Run File" })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false, desc = "Run Project" })

-- Copilot (Completion)
map("i", "<C-J>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })
map("i", "<C-k>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot word" })
map("i", "<C-l>", "<Plug>(copilot-accept-line)", { desc = "Accept Copilot line" })

-- Copilot Chat
map("n", "<leader>zc", ":CopilotChat<CR>", { desc = "Chat with Copilot" })
map("v", "<Leader>ze", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
map("v", "<Leader>zr", ":CopilotChatReview<CR>", { desc = "Review Code" })
map("v", "<Leader>zf", ":CopilotChatFix<CR>", { desc = "Fix Code Issues" })
map("v", "<Leader>zo", ":CopilotChatOptimize<CR>", { desc = "Optimize Code" })
map("v", "<leader>zd", ":CopilotChatDocs<CR>", { desc = "Generate Docs" })
map("v", "<leader>zt", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
map("n", "<Leader>zm", ":CopilotChatCommit<CR>", { desc = "Generate Commit Message" })
map("v", "<leader>zs", ":CopilotChatCommit<CR>", { desc = "Generate Commit for Selection" })

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map("c", "<c-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- Gitsigns
map("n", "<leader>hs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', { desc = "Stage current hunk" })
map("n", "<leader>hr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', { desc = "Reset current hunk" })
map("n", "<leader>hS", '<cmd>lua require"gitsigns".stage_buffer()<CR>', { desc = "Stage entire buffer" })
map("n", "<leader>hu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { desc = "Undo stage hunk" })
map("n", "<leader>hR", '<cmd>lua require"gitsigns".reset_buffer()<CR>', { desc = "Reset entire buffer" })
map("n", "<leader>hp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', { desc = "Preview current hunk" })
map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = "Blame current line (full)" })
map("n", "<leader>tb", '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', { desc = "Toggle current line blame" })
map("n", "<leader>hd", '<cmd>lua require"gitsigns".diffthis()<CR>', { desc = "Show diff of current file" })
map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = "Show diff with previous commit" })
map("n", "<leader>td", '<cmd>lua require"gitsigns".toggle_deleted()<CR>', { desc = "Toggle deleted lines" })
map("v", "<leader>hs", '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', { desc = "Stage selected hunk" })
map("v", "<leader>hr", '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', { desc = "Reset selected hunk" })

-- Markdown Preview
map("n", "<leader>mp", "<Plug>MarkdownPreview", { desc = "Markdown preview start" })
map("n", "<leader>ms", "<Plug>MarkdownPreviewStop", { desc = "Markdown preview stop" })
map("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", { desc = "Markdown preview toggle" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Todo Comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })
