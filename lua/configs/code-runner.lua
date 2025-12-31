require("code_runner").setup {
  mode = "better_term",
  better_term = {
    clean = true,
    number = 1,
    init = nil,
  },
  filetype = {
    -- Scripting & Interpreted Languages
    python = "python3 -u",
    typescript = "deno run",
    javascript = "node",
    lua = "lua",
    sh = "bash",
    perl = "perl",
    ruby = "ruby",
    php = "php",
    dart = "dart",

    -- Compiled Languages (Simple)
    go = "go run",
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt",
    },

    -- Smart Configurations
    rust = function()
      local in_cargo = vim.fn.findfile("Cargo.toml", ".;") ~= ""
      if in_cargo then
        return "cargo run"
      end
      return {
        "cd $dir &&",
        "rustc $fileName &&",
        "./$fileNameWithoutExt",
      }
    end,

    cpp = function()
      local in_cmake = vim.fn.findfile("CMakeLists.txt", ".;") ~= ""
      if in_cmake then
        return "mkdir -p build && cd build && cmake .. && make && ./$fileNameWithoutExt"
      end
      return {
        "cd $dir &&",
        "g++ -std=c++17 $fileName -o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      }
    end,

    c = function()
      return {
        "cd $dir &&",
        "gcc $fileName -o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      }
    end,
  },
  project = {},
}
