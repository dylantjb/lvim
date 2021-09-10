-- general
lvim.format_on_save = false
lvim.log.level = "warn"
lvim.lint_on_save = true
lvim.colorscheme = "doom-one"
lvim.lsp.diagnostics.virtual_text = false
vim.opt.relativenumber = true
vim.opt.timeoutlen = 500

-- python
lvim.lang.python.formatters = { { exe = "black" }, { exe = "isort" } }
lvim.lang.python.linters = { { exe = "flake8" } }

-- options
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- which key
lvim.builtin.which_key.setup.window = { padding = { 0, 0, 0, 0 } }
lvim.builtin.which_key.setup.layout = {
  height = { min = 1, max = 10 }, -- min and max height of the columns
  spacing = 3,
  align = "left",
}

lvim.builtin.which_key.mappings.b.c = lvim.builtin.which_key.mappings.c
lvim.builtin.which_key.mappings.s.c = lvim.builtin.which_key.mappings.L.c
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope projects<cr>", "Find project" }
lvim.builtin.which_key.mappings.s.s = {
  "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
  "Colorscheme"
}
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings.c = nil
lvim.builtin.which_key.mappings.L.c = nil

-- additional plugins
lvim.plugins = {
  {
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = ""
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
    require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        use_local_scrolloff = false,
        respect_scrolloff = false,
        cursor_scrolls_alone = false,
        easing_function = nil,
    })
    end
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").config()
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "haorenW1025/floatLf-nvim",
    config = function()
      vim.g.floatLf_autoclose = 1
    end
  },
  {
    "NTBBloodbath/doom-one.nvim",
    config = function()
      vim.g.doom_one_telescope_highlights = true
      vim.g.doom_one_italic_comments = true
    end
  }
}

-- dashboard
lvim.builtin.dashboard.custom_header = {
"                                                                              ",
        "=================     ===============     ===============   ========  ========",
        "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
        "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
        "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
        "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
        "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
        "||.=='    _-'                                                     `' |  /==.||",
        "=='    _-'                        N E O V I M                         \\/   `==",
        "\\   _-'                                                                `-_   /",
        " `''                                                                      ``'  ",
        "                                                                               ",
}

lvim.builtin.dashboard.custom_section.a.description = { "  Find File                      SPC s f" }
lvim.builtin.dashboard.custom_section.b.description = { "  Recent Projects                SPC s p" }
lvim.builtin.dashboard.custom_section.c.description = { "  Recently Opened Files          SPC s r" }
lvim.builtin.dashboard.custom_section.d.description = { "  Find Word                      SPC s t" }
lvim.builtin.dashboard.custom_section.e.description = { "  Open Private Configuration     SPC s c" }
