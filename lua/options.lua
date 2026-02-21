require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.scrolloff = 7

-- Search settings
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

-- UI settings
o.signcolumn = "yes" -- Always show sign column
o.updatetime = 250 -- Faster completion/updates
o.undofile = true -- Persistent undo

-- Global variables
vim.g.copilot_no_tab_map = true

-- Required for CopilotChat autocomplete menu
vim.opt.completeopt:append("popup")

-- Set custom path for VSCode-like snippets
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/my_snippets"

-- Auto-detect FreeFEM++ .edp files
vim.filetype.add {
  extension = {
    edp = "edp",
  },
}
