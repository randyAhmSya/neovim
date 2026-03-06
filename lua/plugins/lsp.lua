return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = { notification = { window = { winblend = 0 } } } },
    'hrsh7th/cmp-nvim-lsp',
    'b0o/schemastore.nvim',
  },
  config = function()
    -- Load konfigurasi per bahasa
    require 'plugins.lsp-servers.javascript'
    require 'plugins.lsp-servers.python'
    require 'plugins.lsp-servers.php'
    require 'plugins.lsp-servers.dart'
    require 'plugins.lsp-servers.kotlin'
    require 'plugins.lsp-servers.web'
    require 'plugins.lsp-servers.devops'

    -- LSP Attach dengan keymaps
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        map('<leader>li', ':LspInfo<CR>', 'LSP Info')
        map('<leader>lr', ':LspRestart<CR>', 'LSP Restart')

        -- Document highlight
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end

        -- Inlay hints
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- === MASON TOOLS INSTALLER ===
    local ensure_installed = {
      -- ===== JAVASCRIPT/TYPESCRIPT =====
      'typescript-language-server',
      'eslint',
      'eslint_d',
      'prettier',

      -- ===== PYTHON =====
      'pyright',
      'ruff',
      'black',
      'isort',
      'flake8',

      -- ===== PHP =====
      'intelephense',
      'phpactor',
      'php-cs-fixer',
      'phpstan',
      -- 'composer',

      -- ===== DART/FLUTTER =====
      -- 'dart',
      -- 'flutter',

      -- ===== KOTLIN =====
      'kotlin-language-server',

      -- ===== SWIFT =====
      -- 'sourcekit-lsp',

      -- ===== WEB =====
      'html-lsp',
      'css-lsp',
      'tailwindcss-language-server',
      'json-lsp',
      'yaml-language-server',

      -- ===== DEVOPS =====
      'bash-language-server',
      'dockerfile-language-server',
      'terraform-ls',
      'shellcheck',
      'shfmt',

      -- ===== LAINNYA =====
      'marksman',
      'sqlls',
      'vim-language-server',
      'stylua',
      'lua-language-server',
      'yamllint',
      'markdownlint',
    }

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
      auto_update = true,
      run_on_start = true,
    }
  end,
}
