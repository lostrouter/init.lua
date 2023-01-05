vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- when in visual, move the selected lines up or down 1
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- when use <C-d> or <C-u> keep the cursor midpage
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- when searching, keep the found search term mid page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- cool paste where it doesn't swap the pasted over text into the buffer
vim.keymap.set("x", "<leader>p", "\"_dp")

-- open search and replace and prepopulate with word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- apend line below to current line but keep cursor at 0
vim.keymap.set("n", "J", "mzJ`z")



