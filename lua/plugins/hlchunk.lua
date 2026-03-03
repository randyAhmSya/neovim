return {
  'shellRaining/hlchunk.nvim',
  enable = true,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
        priority = 15,
        use_treesitter = true,
        chars = {
          horizontal_line = '─',
          vertical_line = '│',
          left_top = '╭',
          left_bottom = '╰',
          right_arrow = '▶',
        },
        style = '#ffa500',
      },
      line_num = {
        enable = false,
        style = '#1e8c45',
      },
    }
  end,
}
