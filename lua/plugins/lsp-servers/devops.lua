local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Docker
vim.lsp.config('dockerls', {
  capabilities = capabilities,
})

-- Terraform
vim.lsp.config('terraformls', {
  capabilities = capabilities,
})

-- Bash
vim.lsp.config('bashls', {
  capabilities = capabilities,
})

-- Markdown
vim.lsp.config('marksman', {
  capabilities = capabilities,
})

-- SQL
vim.lsp.config('sqlls', {
  capabilities = capabilities,
})

vim.lsp.enable 'dockerls'
vim.lsp.enable 'terraformls'
vim.lsp.enable 'bashls'
vim.lsp.enable 'marksman'
vim.lsp.enable 'sqlls'
