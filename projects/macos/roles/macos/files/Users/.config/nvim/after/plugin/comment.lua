require('Comment').setup({
  toggler = {
    line = '<leader>/',
  },
  opleader = {
    line = '<leader>/',
  },
  ignore = '^$'
})

local ft = require('Comment.ft')

ft({
  'yaml',
  'helm',
}, '#%s')
