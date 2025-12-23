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
