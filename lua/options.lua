require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.scrolloff = 7

-- Set custom path for VSCode-like snippets
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/my_snippets"

-- Auto-detect FreeFEM++ .edp files
vim.filetype.add {
  extension = {
    edp = "edp",
  },
}
