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
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    -- config = function()
    --   require("supermaven-nvim").setup({
    --     keymaps = {
    --       accept_suggestion = "<C-k>",
    --       clear_suggestion = "<C-]>",
    --       accept_word = "<C-j>",
    --     },
    --   })
    -- end,
    opts = {
      disable_inline_completion = false, -- disables inline completion for use with cmp
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
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },
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
        "black",
        "flake8",
        "pyright",
        "debugpy",

        -- rust
        "rust-analyzer",

        -- shell
        "shfmt",
        "shellcheck"
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
      "terraform"
  		},
  	},
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { adaptive_size = true }
    }
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
    lazy = false
  },
  {
    "tpope/vim-unimpaired",
    lazy = false
  },
  {
    "tpope/vim-abolish",
    lazy = false
  },
  {
    "tpope/vim-surround",
    lazy = false
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("configs.rest").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
