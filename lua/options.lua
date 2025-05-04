require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
-- Set foldlevel to a high value to open all folds by default
o.foldlevel = 99
-- Optionally, you can also set these for better folding experience
o.foldcolumn = "1" -- '0' is another option
o.foldlevelstart = 99
o.foldenable = false
