require("formatter").setup {
  -- Enable or disable logging
    logging = true,
  -- Set the log level
    log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
    filetype = {
        rust = {require("formatter.filetypes.rust").rustfmt},
        toml = {require("formatter.filetypes.toml").taplo},
        yaml = {require("formatter.filetypes.yaml").prettier},
        json = {require("formatter.filetypes.json").prettier},
        css = {require("formatter.filetypes.css").prettier},
        html = {require("formatter.filetypes.html").prettier},
        typescript = {require("formatter.filetypes.typescript").prettier},
        javascript = {require("formatter.filetypes.javascript").prettier},
        python = {require("formatter.filetypes.python").black},
        cpp = {require("formatter.filetypes.cpp").black},
        c = {require("formatter.filetypes.c").black},
    },

    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
    }
}

require'Comment'.setup()
require("nvim-autopairs").setup {}
require("persisted").setup()
require("telescope").load_extension("persisted")

