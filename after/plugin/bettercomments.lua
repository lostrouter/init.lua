--TODO asdf
--FIXME asdfas
--WARNING pototat
--! asdffasd
--* info
require('better-comment').Setup({
    tags = {
        {
            name = "TODO",
            fg = "white",
            bg = "#31748f",
            bold = true,
            virtual_text = "",
        },
        {
            name = "FIX",
            fg = "white",
            bg = "#eb6f92",
            bold = true,
            virtual_text = "",
        },
        {
            name = "WARNING",
            fg = "#f6c177",
            bg = "",
            bold = false,
            virtual_text = "",
        },
        {
            name = "!",
            fg = "#eb6f92",
            bg = "",
            bold = true,
            virtual_text = "",
        },
        {
            name = "*",
            fg = "#9ccfd8",
            bg = "",
            bold = false,
            virtual_text = "",
        }

    }
})
