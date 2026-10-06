-- nvim 0.12 update: https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
-- NOTE: on the `main` branch nvim-treesitter only installs parsers: highlighting and
-- indentation are enabled by the FileType autocmd below (the old `opts` like
-- `highlight`, `indent`, `auto_install` from the `master` branch no longer exist).
return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- the main branch does not support lazy-loading
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    config = function()
      local ts = require 'nvim-treesitter'

      -- Installed at startup (already installed parsers are skipped)
      ts.install {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'python',
        'java',
        'javascript',
        'make',
        'json',
        'sql',
        'typescript',
        'gitignore',
      }

      -- Never auto-installed
      local ignore_install = {
        latex = true, -- causa conflitto con texlab
      }

      local function attach(buf, lang)
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start, buf, lang)
        -- Enable treesitter-based indentation only when the parser ships indent
        -- rules (make, vim, diff... don't), otherwise keep the filetype indent
        local ok, indents = pcall(vim.treesitter.query.get, lang, 'indents')
        if ok and indents then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('kickstart-treesitter', { clear = true }),
        callback = function(args)
          local buf = args.buf
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end

          if vim.treesitter.language.add(lang) then
            attach(buf, lang)
            return
          end

          -- Autoinstall languages that are not installed, then attach to the buffer.
          -- Buffers without a parser (e.g. tex) keep vimtex/filetype settings.
          if ignore_install[lang] or not vim.list_contains(ts.get_available(), lang) then
            return
          end
          ts.install(lang):await(function()
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(buf) and vim.treesitter.language.add(lang) then
                attach(buf, lang)
              end
            end)
          end)
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
