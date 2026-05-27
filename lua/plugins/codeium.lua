return {
  'Exafunction/codeium.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('codeium').setup {
      enable_chat = false,
      virtual_text = {
        enabled = true,
      },
    }
  end,
}
