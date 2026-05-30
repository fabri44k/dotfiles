return {
  'rmagatti/auto-session',
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

    -- Ignora il filetype di neo-tree per evitare conflitti
    bypass_save_filetypes = { 'neo-tree' },

    -- Chiude esplicitamente Neo-tree prima di salvare la sessione
    pre_save_cmds = { 'Neotree close' },

    -- (Opzionale) Riapre Neo-tree automaticamente dopo aver ripristinato la sessione
    -- post_restore_cmds = { "Neotree show" },
  },
}
