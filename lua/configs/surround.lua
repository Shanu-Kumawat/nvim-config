return {
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "<leader>sa", -- [S]urround [A]dd
    normal_cur = "<leader>ss", -- [S]urround [S]elf (current line)
    normal_line = "<leader>sA", -- [S]urround [A]dd (line)
    normal_cur_line = "<leader>sS",
    visual = "<leader>s", -- [S]urround (visual selection)
    visual_line = "<leader>S",
    delete = "<leader>sd", -- [S]urround [D]elete
    change = "<leader>sc", -- [S]urround [C]hange
    change_line = "<leader>sC",
  },
  -- surrogates = {
  --   -- Add custom surrounds here
  -- },
}
