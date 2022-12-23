local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-space>'] = cmp.mapping.complete(),
})


lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "g<C-d>", ":vsplit | lua  vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)

end)

lsp.setup()

-- these are breaking current key bindings. killing for now

-- https://github.com/neovim/neovim/issues/20784
-- workaround to rename and update imports for typescript
-- local function rename_file()
--     local source_file, target_file
-- 
--     vim.ui.input({
--         prompt = "Source : ",
--         completion = "file",
--         default = vim.api.nvim_buf_get_name(0)
--     },
--         function(input)
--             source_file = input
--         end
--     )
--     vim.ui.input({
--         prompt = "Target : ",
--         completion = "file",
--         default = source_file
--     },
--         function(input)
--             target_file = input
--         end
--     )
-- 
--     local params = {
--         command = "_typescript.applyRenameFile",
--         arguments = {
--             {
--                 sourceUri = source_file,
--                 targetUri = target_file,
--             },
--         },
--         title = ""
--     }
-- 
--     vim.lsp.util.rename(source_file, target_file)
--     vim.lsp.buf.execute_command(params)
-- end
-- 
-- 
-- -- the original gh issue had a different setup command.
-- -- the ts plugin docs say to use this format instead
-- require("typescript").setup({
--     server = { -- pass options to lspconfig's setup method
--         commands = {
--             RenameFile = {
--                 rename_file,
--                 description = "Rename File"
--             },
--         }
--     },
-- })
-- 
-- -- found on reddit. maybe make renaming a symbol/var easier?
-- function LspRename()
--     local curr_name = vim.fn.expand("<cword>")
--     local value = vim.fn.input("LSP Rename: ", curr_name)
--     local lsp_params = vim.lsp.util.make_position_params()
-- 
--     if not value or #value == 0 or curr_name == value then return end
-- 
--     -- request lsp rename
--     lsp_params.newName = value
--     vim.lsp.buf_request(0, "textDocument/rename", lsp_params, function(_, res, ctx, _)
--         if not res then return end
-- 
--         -- apply renames
--         local client = vim.lsp.get_client_by_id(ctx.client_id)
--         vim.lsp.util.apply_workspace_edit(res, client.offset_encoding)
-- 
--         -- print renames
--         local changed_files_count = 0
--         local changed_instances_count = 0
-- 
--         if (res.documentChanges) then
--             for _, changed_file in pairs(res.documentChanges) do
--                 changed_files_count = changed_files_count + 1
--                 changed_instances_count = changed_instances_count + #changed_file.edits
--             end
--         elseif (res.changes) then
--             for _, changed_file in pairs(res.changes) do
--                 changed_instances_count = changed_instances_count + #changed_file
--                 changed_files_count = changed_files_count + 1
--             end
--         end
-- 
--         -- compose the right print message
--         print(string.format("renamed %s instance%s in %s file%s. %s", 
--         changed_instances_count,
--         changed_instances_count == 1 and '' or 's',
--         changed_files_count,
--         changed_files_count == 1 and '' or 's',
--         changed_files_count > 1 and "To save them run ':wa'" or ''
--         ))
--     end)
-- end
