return {
  {
    'stevearc/overseer.nvim',
    opts = {
      {
        templates = {
          'builtin',
          'vscode',
        },
      },
    },
  },
  { 'akinsho/bufferline.nvim', opts = { options = { separator_style = 'slope' } } },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
}
