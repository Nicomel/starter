require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-m>", "<C-i>", { desc = "Move forward in jumplist" })

-- General key mappings
map("n", "<Esc>", "<esc>", { desc = "Escape" })
map("n", "<C-q>", "<cmd> q <CR>", { desc = "Quit neovim" })
map("n", "<leader>h", "<C-w>s<C-w>l", { desc = "New horizontal split" })
map("n", "<leader>v", "<C-w>v<C-w>l", { desc = "New vertical split" })
map("n", "<leader>o", "<cmd> only<CR>", { desc = "Close split and keep current buffer" })
