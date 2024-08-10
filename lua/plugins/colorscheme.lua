return {
  'lcroberts/persistent-colorscheme.nvim',
  lazy = false,
  priority = 1000,
  dependencies = {
    'RRethy/nvim-base16', -- Lots of baked-in themes and support to add more
    {
      'folke/tokyonight.nvim',
      opts = {
        style = 'night',
      },
    },
  },
  opts = {
    colorscheme = 'base16-gruvbox-material-dark-hard',
  },
}
