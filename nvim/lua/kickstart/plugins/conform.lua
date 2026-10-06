return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- Conform is the only formatter on save: one formatter per filetype.
      -- LSP formatting is used only for filetypes not listed below (e.g. rust).
      format_on_save = {
        timeout_ms = 1000, -- prettier (node) can take longer than 500ms to start
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- ruff check --fix (removes unused imports), sort imports, then format
        python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        sh = { 'shfmt' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
      },
      formatters = {
        -- A .clang-format in the project (or any parent dir) wins;
        -- without one, fall back to LLVM with 4-space indentation.
        ['clang-format'] = {
          prepend_args = function(_, ctx)
            if vim.fs.find({ '.clang-format', '_clang-format' }, { path = ctx.dirname, upward = true })[1] then
              return {}
            end
            return { '--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}' }
          end,
        },
        shfmt = {
          args = { '-i', '4', '-filename', '$FILENAME' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
