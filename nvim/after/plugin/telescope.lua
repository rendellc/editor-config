local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader><space>', builtin.treesitter, {})
-- vim.keymap.set('n', '<leader>ps', function()
	-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

require('telescope').setup({
	file_ignore_patterns = { "*.meta" },
})
