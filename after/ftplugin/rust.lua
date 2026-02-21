local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

-- Code Actions
map("n", "<leader>ca", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr, desc = "Rust: Code Action" })

-- Hover Actions
map("n", "K", function()
  vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr, desc = "Rust: Hover Actions" })

-- Debuggables
map("n", "<leader>rd", function()
  vim.cmd.RustLsp("debuggables")
end, { silent = true, buffer = bufnr, desc = "Rust: Debuggables" })

-- Runnables
map("n", "<leader>rr", function()
  vim.cmd.RustLsp("runnables")
end, { silent = true, buffer = bufnr, desc = "Rust: Runnables" })

-- Expand Macro
map("n", "<leader>rm", function()
  vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "Rust: Expand Macro" })

-- Explain Error
map("n", "<leader>re", function()
  vim.cmd.RustLsp("explainError")
end, { silent = true, buffer = bufnr, desc = "Rust: Explain Error" })

-- Render Diagnostic
map("n", "<leader>rD", function()
  vim.cmd.RustLsp("renderDiagnostic")
end, { silent = true, buffer = bufnr, desc = "Rust: Render Diagnostic" })

-- Open Cargo.toml
map("n", "<leader>rc", function()
  vim.cmd.RustLsp("openCargo")
end, { silent = true, buffer = bufnr, desc = "Rust: Open Cargo.toml" })

-- Open Docs
map("n", "<leader>rO", function()
  vim.cmd.RustLsp("openDocs")
end, { silent = true, buffer = bufnr, desc = "Rust: Open docs.rs" })
