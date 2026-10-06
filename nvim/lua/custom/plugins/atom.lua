return
{
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'dark',
    }
    -- Enable theme
    require('onedark').load()

    -- Diagnostic messages in italic (signs in the gutter stay upright).
    -- Resolve links first so the theme colors are kept.
    for _, kind in ipairs { 'VirtualText', 'VirtualLines', 'Floating' } do
      for _, severity in ipairs { 'Error', 'Warn', 'Info', 'Hint' } do
        local group = 'Diagnostic' .. kind .. severity
        local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
        vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', hl, { italic = true }))
      end
    end
  end
}
