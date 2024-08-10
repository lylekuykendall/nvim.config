return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  config = function(_, opts)
    require('gopher').setup {
      go = 'go',
      gomodifytags = 'gomodifytags',
      gotests = 'gotests',
      impl = 'impl',
      iferr = ':wqferr',
    }
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4

    vim.keymap.set('n', '<leader>gsj', '<CMD> GoTagAdd json <CR>', { desc = 'Add json struct tags' })
    vim.keymap.set('n', '<leader>gsy', '<CMD> GoTagAdd yaml <CR>', { desc = 'Add yaml struct tags' })
    vim.keymap.set('n', '<leader>gmt', '<CMD> GoMod tidy <CR>', { desc = 'Run go mod tidy' })
    vim.keymap.set('n', '<leader>gt', '<CMD> GoTestAdd <CR>', { desc = 'Generate test for function/method under cursor' })
    vim.keymap.set('n', '<leader>gt', '<CMD> GoTestsAll <CR>', { desc = 'Generate tests for all functions/methods in current file' })
    vim.keymap.set('n', '<leader>ge', '<CMD> GoTestsExp <CR>', { desc = 'Generate tests only for exported function/methods in current file' })
    vim.keymap.set('n', '<leader>gp', '<CMD> GoGenerate <CR>', { desc = 'Run go generate in pwd' })
    vim.keymap.set('n', '<leader>gf', '<CMD> GoGenerate % <CR>', { desc = 'Run go generate for current file' })
    vim.keymap.set('n', '<leader>gc', '<CMD> GoCmt <CR>', { desc = 'Generate doc comment for public package/function/interface/struct under cursor' })
    vim.keymap.set('n', '<leader>gie', '<CMD> GoIfErr <CR>', { desc = 'Generate if err on current line' })
    vim.keymap.set('n', '<leader>gii', 'GoImpl ', { desc = 'Implement interface' })
    vim.keymap.set('n', '<leader>gge', ':GoGet ', { desc = 'Go get' })
  end,
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  ---@type gopher.Config
  opts = {},
}
