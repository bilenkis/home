require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "vim",
    "help",
    "go",
    "hcl",
    "jsonnet",
    "bash",
    -- "yaml",
    "json",
    -- "gotmpl",
  },
  auto_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  }
}

-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.gotmpl = {
--   install_info = {
--     url = "https://github.com/ngalaiko/tree-sitter-go-template",
--     files = { "src/parser.c" }
--   },
--   filetype = "gotmpl",
--   used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" }
-- }
