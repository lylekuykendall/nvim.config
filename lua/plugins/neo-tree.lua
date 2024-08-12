-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', '<CMD>Neotree reveal_force_cwd position=left toggle<CR>', desc = 'NeoTree cwd' },
    { '<C-n>', '<CMD>Neotree reveal_force_cwd position=left toggle<CR>', desc = 'NeoTree cwd' },
    { '<leader>e', '<CMD>Neotree reveal_force_cwd position=left toggle<CR>', desc = 'NeoTree cwd' },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
