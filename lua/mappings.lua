require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disabled key mappings
-- map("n", "<Tab>", "", { desc = "Disable Tab" })
-- map("n", "<TAB>", "", { desc = "Disable TAB" })
-- map("n", "<S-Tab>", "", { desc = "Disable Shift-Tab" })
map("n", "<Esc>", "", { desc = "Disable Escape" })
map("n", "<C-l>", "<C-i>", { desc = "Move forward in jumplist" })

-- General key mappings
map("n", "<Esc>", "<esc>", { desc = "Escape" })
map("n", "<C-q>", "<cmd> q <CR>", { desc = "Quit neovim" })
map("n", "<leader>h", "<C-w>s<C-w>l", { desc = "New horizontal split" })
map("n", "<leader>v", "<C-w>v<C-w>l", { desc = "New vertical split" })
map("n", "<leader>o", "<cmd> only<CR>", { desc = "Close split and keep current buffer" })
map("n", "<leader>xq", "<cmd> cclose<CR>", { desc = "Close quick fix list" })
map("n", "<leader>;", "<cmd> tab split<CR>", { desc = "Create new tab from the current buffer" })
map("n", "<leader>:", "<cmd> tabc<CR>", { desc = "Close tab" })
map("n", "<leader>w", "<cmd> bprevious<cr>:bdelete #<cr>", { desc = "Close current buffer and go back to the previous one" })

map("i", "<Esc>", "<esc>", { desc = "Exit insert mode" })
map("n", "<leader>tt", function() require("base46").toggle_transparency() end, { desc = "Toggle transparency" })

-- Fugitive key mappings
map("n", "<leader>gs", "<cmd> Git<CR>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd> Git commit -v -q<CR>", { desc = "Git commit verbose and quiet if successful" })
map("n", "<leader>ga", "<cmd> Git commit --amend<CR>", { desc = "Amend previous commit" })
map("n", "<leader>gt", "<cmd> Git commit -v -q %<CR>", { desc = "Commit the current file" })
map("n", "<leader>gd", "<cmd> Gvdiffsplit!<CR>", { desc = "Vertical diff split of the current file" })
map("n", "<leader>ge", "<cmd> Gedit<CR>", { desc = "Edit a fugitive object" })
map("n", "<leader>gr", "<cmd> Gread<CR>", { desc = "Empty the buffer and read a fugitive object" })
map("n", "<leader>gw", "<cmd> Gwrite<CR>", { desc = "Write to the current file's path and stage the results" })
map("n", "<leader>gl", "<cmd> Gclog<CR>", { desc = "Load commit history into the quick fix list" })
map("n", "<leader>g0", "<cmd> 0Gclog<CR>", { desc = "Commit history of the current file into the quick fix list" })
map("n", "<leader>gp", "<cmd> Ggrep<Space>", { desc = "Grep" })
map("n", "<leader>gm", "<cmd> GMove<Space>", { desc = "Move" })
map("n", "<leader>gb", "<cmd> Git branch<Space>", { desc = "Git branch" })
map("n", "<leader>go", "<cmd> Git checkout<Space>", { desc = "Git checkout" })
map("n", "<leader>gx", "<cmd> only<CR>", { desc = "Keep only the current selected pane opened" })
map("n", "<leader>g2", "<cmd> diffget //2<Space>", { desc = "Fetch hunk from the target parent (on the left)" })
map("n", "<leader>g3", "<cmd> diffget //3<Space>", { desc = "Fetch hunk from the merge parent (on the right)" })

-- Gitsigns key mappings
map("n", "]c", function() require('gitsigns').next_hunk() end, { desc = "Next hunk" })
map("n", "[c", function() require('gitsigns').prev_hunk() end, { desc = "Prev hunk" })
map("n", "<leader>hs", function() require('gitsigns').stage_hunk() end, { desc = "Stage hunk" })
map("n", "<leader>hr", function() require('gitsigns').reset_hunk() end, { desc = "Reset hunk" })
map("n", "<leader>hu", function() require('gitsigns').undo_stage_hunk() end, { desc = "Undo stage hunk" })
map("n", "<leader>hR", function() require('gitsigns').reset_buffer() end, { desc = "Reset buffer" })
map("n", "<leader>hp", function() require('gitsigns').preview_hunk() end, { desc = "Preview hunk" })
map("n", "<leader>hb", function() require('gitsigns').blame_line{full=true} end, { desc = "Blame line" })
map("n", "<leader>tb", function() require('gitsigns').toggle_current_line_blame() end, { desc = "Toggle current line blame" })
map("n", "<leader>hd", function() require('gitsigns').diffthis() end, { desc = "Diff this" })
map("n", "<leader>hD", function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
map("n", "<leader>td", function() require('gitsigns').toggle_deleted() end, { desc = "Toggle deleted" })

map("v", "<leader>hs", function() require('gitsigns').stage_hunk() end, { desc = "Stage hunk" })
map("v", "<leader>hr", function() require('gitsigns').prev_hunk() end, { desc = "Prev hunk" })

map("o", "ih", "<cmd> <C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
map("x", "ih", "<cmd> <C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })

-- Rest key mappings
map("n", "<leader>j", function() require('rest-nvim').run() end, { desc = "Run REST request" })

-- Copilot chat mappings
-- Quick chat with Copilot
map("v", "<leader>ccq", function()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
      require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end
  end,
  { desc = "CopilotChat - Quick chat" }
)
