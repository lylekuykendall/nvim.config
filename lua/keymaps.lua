-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open diagnostic in floating window' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window splits
vim.keymap.set('n', '<leader>h', ':split<CR>', { desc = 'Split down' })
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Split right' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd> w <cr>', { desc = 'Save buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>x', '<cmd> bd <cr>', { desc = 'Close buffer' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- toggle terminal
vim.keymap.set('n', '<A-h>', function()
  require('nvterm.terminal').toggle 'horizontal'
end, { desc = 'Toggle horizontal terminal' })
vim.keymap.set('t', '<A-h>', function()
  require('nvterm.terminal').toggle 'horizontal'
end, { desc = 'Toggle horizontal terminal' })
vim.keymap.set('n', '<A-v>', function()
  require('nvterm.terminal').toggle 'vertical'
end, { desc = 'Toggle vertical terminal' })
vim.keymap.set('t', '<A-v>', function()
  require('nvterm.terminal').toggle 'vertical'
end, { desc = 'Toggle vertical terminal' })
vim.keymap.set('n', '<A-.>', function()
  require('nvterm.terminal').toggle 'float'
end, { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<A-.>', function()
  require('nvterm.terminal').toggle 'float'
end, { desc = 'Toggle floating terminal' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
