vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

-- easier split nav
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")

-- nav to tmux panes
vim.keymap.set("n", "<silent> <C-h>", vim.cmd.TmuxNavigatorLeft)
vim.keymap.set("n", "<silent> <C-j>", vim.cmd.TmuxNavigatorDown)
vim.keymap.set("n", "<silent> <C-k>", vim.cmd.TmuxNavigatorUp)
vim.keymap.set("n", "<silent> <C-l>", vim.cmd.TmuxNavigatorRight)


