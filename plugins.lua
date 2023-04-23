local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "vimwiki/vimwiki",
    event = "BufEnter *.md",
    keys = {"<leader>ww", "<leader>wt", "<leader>ws"},
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "D:/vimwiki/home/",
          path_html = "D:/vimwiki/wiki_html/",
          template_path = "D:/vimwiki/templates/",
          template_default = "def_template",
          auto_toc = 1,
          template_ext = ".html",
        },
        {
          path = "D:/vimwiki/pattern_recognition/lec_10/",
          path_html = "D:/vimwiki/wiki_html/",
          template_path = "D:/vimwiki/templates/",
          template_default = "def_template",
          auto_toc = 1,
          template_ext = ".html",
        },
      }
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
