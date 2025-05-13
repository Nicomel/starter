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
map("n", "]c", function()
  require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
map("n", "[c", function()
  require("gitsigns").prev_hunk()
end, { desc = "Prev hunk" })
map("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>hu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
map("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
map("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>hb", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "Blame line" })
map("n", "<leader>tb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle current line blame" })
map("n", "<leader>hd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this" })
map("n", "<leader>hD", function()
  require("gitsigns").diffthis "~"
end, { desc = "Diff this ~" })
map("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })

map("v", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("v", "<leader>hr", function()
  require("gitsigns").prev_hunk()
end, { desc = "Prev hunk" })

map("o", "ih", "<cmd> <C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
map("x", "ih", "<cmd> <C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })

-- Gp nvim mappings
local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

-- Chat commands
map({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions "New Chat")
map({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions "Toggle Chat")
map({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions "Chat Finder")
map("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions "Visual Chat New")
map("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions "Visual Chat Paste")
map("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions "Visual Toggle Chat")
map({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions "New Chat split")
map({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions "New Chat vsplit")
map({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions "New Chat tabnew")
map("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions "Visual Chat New split")
map("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions "Visual Chat New vsplit")
map("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions "Visual Chat New tabnew")

-- Prompt commands
map({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions "Inline Rewrite")
map({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions "Append (after)")
map({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions "Prepend (before)")
map("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions "Visual Rewrite")
map("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions "Visual Append (after)")
map("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions "Visual Prepend (before)")
map("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions "Implement selection")
map({ "n", "i" }, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions "Popup")
map({ "n", "i" }, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions "GpEnew")
map({ "n", "i" }, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions "GpNew")
map({ "n", "i" }, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions "GpVnew")
map({ "n", "i" }, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions "GpTabnew")
map("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions "Visual Popup")
map("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions "Visual GpEnew")
map("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions "Visual GpNew")
map("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions "Visual GpVnew")
map("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions "Visual GpTabnew")
map({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions "Toggle Context")
map("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions "Visual Toggle Context")
map({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions "Stop")
map({ "n", "i", "v", "x" }, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions "Next Agent")

-- optional Whisper commands with prefix <C-g>w
map({ "n", "i" }, "<C-g>ww", "<cmd>GpWhisper<cr>", keymapOptions "Whisper")
map("v", "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions "Visual Whisper")
map({ "n", "i" }, "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", keymapOptions "Whisper Inline Rewrite")
map({ "n", "i" }, "<C-g>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions "Whisper Append (after)")
map({ "n", "i" }, "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions "Whisper Prepend (before) ")
map("v", "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions "Visual Whisper Rewrite")
map("v", "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions "Visual Whisper Append (after)")
map("v", "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions "Visual Whisper Prepend (before)")
map({ "n", "i" }, "<C-g>wp", "<cmd>GpWhisperPopup<cr>", keymapOptions "Whisper Popup")
map({ "n", "i" }, "<C-g>we", "<cmd>GpWhisperEnew<cr>", keymapOptions "Whisper Enew")
map({ "n", "i" }, "<C-g>wn", "<cmd>GpWhisperNew<cr>", keymapOptions "Whisper New")
map({ "n", "i" }, "<C-g>wv", "<cmd>GpWhisperVnew<cr>", keymapOptions "Whisper Vnew")
map({ "n", "i" }, "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", keymapOptions "Whisper Tabnew")
map("v", "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", keymapOptions "Visual Whisper Popup")
map("v", "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", keymapOptions "Visual Whisper Enew")
map("v", "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", keymapOptions "Visual Whisper New")
map("v", "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions "Visual Whisper Vnew")
map("v", "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", keymapOptions "Visual Whisper Tabnew")
