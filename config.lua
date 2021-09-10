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
lvim.builtin.which_key.setup.plugins.marks = false
lvim.builtin.which_key.setup.plugins.registers = false
lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true
lvim.builtin.which_key.setup.layout.height = { min = 1, max = 10 }
lvim.builtin.which_key.setup.window = { padding = { 0, 0, 0, 0 } }
lvim.builtin.which_key.setup.layout = {
  height = { min = 1, max = 10 }, -- min and max height of the columns
  spacing = 3,
  align = "left",
}

lvim.builtin.which_key.mappings.b.c = lvim.builtin.which_key.mappings.c
lvim.builtin.which_key.mappings.s.c = { "<cmd>edit ~/.config/lvim/config.lua<cr>", "Edit config" }
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
lvim.builtin.which_key.mappings.s.p = nil

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
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
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
lvim.builtin.dashboard.custom_section.e.description = { "  Open Private Configuration     SPC l c" }
