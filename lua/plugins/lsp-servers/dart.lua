local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Dart (Flutter)
vim.lsp.config('dartls', {
  capabilities = capabilities,
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
      lineLength = 80,
      renameFilesWithClasses = 'prompt',
      enableSnippets = true,
    },
  },
  filetypes = { 'dart' },
})

vim.lsp.enable 'dartls'
