local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Intelephense (PHP Language Server)
vim.lsp.config('intelephense', {
  capabilities = capabilities,
  settings = {
    intelephense = {
      stubs = {
        'apache',
        'bcmath',
        'bz2',
        'calendar',
        'Core',
        'ctype',
        'curl',
        'date',
        'dom',
        'exif',
        'fileinfo',
        'filter',
        'ftp',
        'gd',
        'gettext',
        'hash',
        'iconv',
        'imap',
        'intl',
        'json',
        'ldap',
        'libxml',
        'mbstring',
        'mysqli',
        'mysqlnd',
        'openssl',
        'pcntl',
        'pcre',
        'PDO',
        'pdo_mysql',
        'pdo_sqlite',
        'pgsql',
        'Phar',
        'posix',
        'readline',
        'Reflection',
        'session',
        'SimpleXML',
        'soap',
        'sockets',
        'sodium',
        'SPL',
        'sqlite3',
        'standard',
        'tokenizer',
        'xml',
        'xmlreader',
        'xmlwriter',
        'zip',
        'zlib',
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
})

-- PHPActor
vim.lsp.config('phpactor', {
  capabilities = capabilities,
})

vim.lsp.enable 'intelephense'
vim.lsp.enable 'phpactor'
