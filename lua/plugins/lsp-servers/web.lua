local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- HTML
vim.lsp.config('html', {
  capabilities = capabilities,
  filetypes = { 'html', 'twig', 'hbs' },
})

-- CSS
vim.lsp.config('cssls', {
  capabilities = capabilities,
})

-- Tailwind
vim.lsp.config('tailwindcss', {
  capabilities = capabilities,
})

-- JSON
vim.lsp.config('jsonls', {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

-- YAML
vim.lsp.config('yamlls', {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
      validate = true,
    },
  },
})

vim.lsp.enable 'html'
vim.lsp.enable 'cssls'
vim.lsp.enable 'tailwindcss'
vim.lsp.enable 'jsonls'
vim.lsp.enable 'yamlls'
