local autocmd = vim.api.nvim_create_autocmd

-- Kitty terminal padding removal for seamless experience
autocmd("VimEnter", {
  callback = function()
    local kitty_listen = vim.env.KITTY_LISTEN_ON
    if kitty_listen then
      vim.fn.system("kitty @ --to " .. kitty_listen .. " set-spacing margin=0")
    end
  end,
  desc = "Remove Kitty window margins when entering Neovim",
})

autocmd("VimLeavePre", {
  callback = function()
    local kitty_listen = vim.env.KITTY_LISTEN_ON
    if kitty_listen then
      vim.fn.system("kitty @ --to " .. kitty_listen .. " set-spacing margin=10")
    end
  end,
  desc = "Restore Kitty window margins when leaving Neovim",
})

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto-create missing directories on save
autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Restore cursor position when reopening files
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Disable auto-commenting on newline
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

-- Smart line numbers (relative in normal, absolute in insert)
local number_toggle_group = vim.api.nvim_create_augroup("number_toggle", { clear = true })

autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave" }, {
  group = number_toggle_group,
  callback = function()
    if vim.opt.nu:get() and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter" }, {
  group = number_toggle_group,
  callback = function()
    if vim.opt.nu:get() then
      vim.opt.relativenumber = false
      vim.cmd "redraw"
    end
  end,
})

-- Spell checking for writing buffers only (not code)
autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
  desc = "Enable spell checking for writing buffers",
})
