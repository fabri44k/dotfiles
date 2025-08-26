return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
    require('outline').setup {
      providers = {
        priority = { 'lsp', 'coc', 'markdown', 'norg', 'treesitter' },
      },
    }
  end,
  event = 'VeryLazy',
  dependencies = {
    'epheien/outline-treesitter-provider.nvim',
  },
}
