local M = {}

M.opts = function(_, opts)
  opts.pickers = opts.pickers or {}

  -- Keep default behavior (respect .gitignore), but show dotfiles in find_files.
  opts.pickers.find_files = vim.tbl_deep_extend("force", opts.pickers.find_files or {}, {
    hidden = true,
    follow = false,
  })
end

return M
