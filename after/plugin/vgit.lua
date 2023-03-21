vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'


require('vgit').setup({
    keymaps = {
            ['n <leader><C-k>'] = function() require('vgit').hunk_up() end,
            ['n <leader><C-j>'] = function() require('vgit').hunk_down() end,
            ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
    },
    hls = {
        GitSignsAdd = {
            gui = nil,
            fg = '#31748f',
            bg = nil,
            sp = nil,
            override = false,
        },
        GitSignsChange = {
            gui = nil,
            fg = '#f6c177',
            bg = nil,
            sp = nil,
            override = false,
        },
        GitSignsDelete = {
            gui = nil,
            fg = '#ebbcba',
            bg = nil,
            sp = nil,
            override = false,
        },
    }
})
