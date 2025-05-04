return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "diagnostic-languageserver",
        "tailwindcss-language-server",
        "deno",
        "json-lsp",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- python
        "ruff",
        "pyright",
        "debugpy",

        -- rust
        "rust-analyzer",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },
  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "json",
        "python",
        "rust",
        "javascript",
        "typescript",
        "http",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "terraform",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { adaptive_size = true },
    },
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
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "tpope/vim-unimpaired",
    lazy = false,
  },
  {
    "tpope/vim-abolish",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },

  -- Supermaven (free completions)
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    -- config = function()
    --   require("supermaven-nvim").setup({})
    -- end,
    opts = {
      -- disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false, -- disables built in keymaps for more manual control
      keymaps = {
        accept_suggestion = "<C-k>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    },
    -- lazy = false -- inline completion does not load otherwise
  },

  {
    "Robitx/gp.nvim",
    config = function()
      require("gp").setup({
        openai_api_key = os.getenv("OPENAI_API_KEY"),
      })
    end,
    lazy = false,
  },
}
