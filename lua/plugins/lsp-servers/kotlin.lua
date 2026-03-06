local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Kotlin Language Server
vim.lsp.config('kotlin_language_server', {
  capabilities = capabilities,
  settings = {
    kotlin = {
      compiler = {
        jvm = {
          target = '17',
        },
      },
    },
  },
  filetypes = { 'kotlin' },
})

vim.lsp.enable 'kotlin_language_server'
