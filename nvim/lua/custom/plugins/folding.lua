return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  opts = {}, -- needed even when using default config

  -- recommended: disable vim's auto-folding
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  config = function()
    -- default settings
    require('origami').setup {
      pauseFoldsOnSearch = true,
      foldtext = {
        enabled = true,
        padding = 3,
        lineCount = {
          template = '%d lines', -- `%d` is replaced with the number of folded lines
          hlgroup = 'Comment',
        },
        diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = true, -- requires `gitsigns.nvim`
        disableOnFt = { 'snacks_picker_input' }, ---@type string[]
      },
      autoFold = {
        enabled = true,
        kinds = { 'comment', 'imports' }, ---@type lsp.FoldingRangeKind[]
      },
      foldKeymaps = {
        setup = true, -- modifies `h`, `l`, `^`, and `$`
        closeOnlyOnFirstColumn = false, -- `h` and `^` only close in the 1st column
      },
    }
  end,
}

-- OLD UFO CONFIGURATION
-- return {
--   'kevinhwang91/nvim-ufo',
--   dependencies = { 'kevinhwang91/promise-async' },
--   opts = {
--     filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
--   },
--   config = function(_, opts)
--     vim.api.nvim_create_autocmd('FileType', {
--       group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
--       pattern = opts.filetype_exclude,
--       callback = function()
--         require('ufo').detach()
--       end,
--     })
--
--     vim.opt.foldlevelstart = 99
--     require('ufo').setup(opts)
--   end,
-- }
