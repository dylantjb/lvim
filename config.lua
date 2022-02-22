-- general
lvim.log.level = "warn"
lvim.colorscheme = "onedarker"
lvim.format_on_save = false
lvim.lint_on_save = true

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  { exe = "scalafmt", filetypes = { "scala" } },
  { exe = "clang-format", filetypes = { "cpp", "c" } },
}
linters.setup {
  { exe = "pylint", filetypes = { "python" } },
  { exe = "cppcheck", filetypes = { "cpp", "c" } },
}

-- options
vim.opt.timeoutlen = 500
vim.opt.relativenumber = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.show_icons.git = 1
lvim.lsp.diagnostics.virtual_text = false

-- treesitter
lvim.builtin.treesitter.ensure_installed = { "python", "java", "cpp", "c", "scala" }
lvim.builtin.treesitter.highlight.enabled = true

-- which key
lvim.builtin.which_key.setup.window = { padding = { 0, 0, 0, 0 } }
lvim.builtin.which_key.setup.layout = {
  height = { min = 1, max = 10 },
  spacing = 3,
  align = "left",
}
lvim.builtin.which_key.mappings.w =   { "<cmd>:execute ':silent w !sudo tee % > /dev/null' | :edit!<cr>", "Save with sudo" }
lvim.builtin.which_key.mappings.s.R = { "lua require('persistence').load({ last = true })", "Restore session"}
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope projects<cr>", "Find project" }
lvim.builtin.which_key.mappings.s.s = {
  "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
  "Colorscheme"
}
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

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
        mappings = { "<C-u>", "<C-d>", "<C-b>", "zt", "zz", "zb" },
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
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
      }
    end,
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp"
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").config()
    end
  },
  {
    "folke/persistence.nvim",
    event = "VimEnter",
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      }
    end,
  },
  {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("autosave").setup()
    end
  },
  -- {
  --   "scalameta/nvim-metals",
  --   config = function()
  --     require("user.metals").config()
  --   end,
  -- },
}

-- lvim.autocommands.custom_groups = {
--   { "FileType", "scala,sbt", "lua require('user.metals').config()" }
-- }

-- dashboard
lvim.builtin.dashboard.custom_section.a = {
  description = { "  Reload last session            SPC s R" },
  command = "lua require('persistence').load({ last = true })"
}
lvim.builtin.dashboard.custom_section.b = {
  description = { "  Find file                      SPC s f" },
  command = "Telescope find_files"
}
lvim.builtin.dashboard.custom_section.c = {
  description = { "  Open project                   SPC s p" },
  command = "Telescope projects"
}
lvim.builtin.dashboard.custom_section.d = {
  description = { "  Recently opened files          SPC s r" },
  command = "Telescope oldfiles"
}
lvim.builtin.dashboard.custom_section.e = {
  description = { "  Find word                      SPC s t" },
  command = "Telescope live_grep"
}
lvim.builtin.dashboard.custom_section.f = {
  description = { "  Open private configuration     SPC L c" },
  command =  ":e " .. "~/.config/lvim/config.lua"
}

