require('fzf-lua').setup ({
  files = {
    fd_opts = "--color=never --no-ignore --type f --hidden --follow --exclude .git --exclude .terraform",
    rg_opts = '--color=never --files --no-ignore --hidden --follow --glob "!.git" --glob "!.terraform"'
  },
  grep = {
    rg_opts = '--no-ignore --hidden --follow --column --line-number --no-heading --color=always --smart-case --max-columns=512 --glob="!.terraform" --glob="!.git" --glob="!.terragrunt-cache"',
  },
  buffers = {
    file_icons = false,
    color_icons = false,
    sort_lastused = false,
  },
})

vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>w', ':FzfLua live_grep_native<CR>')
vim.keymap.set('n', '<leader>W', ':FzfLua grep_cword<CR>')
vim.keymap.set('n', '<leader>h', ':FzfLua command_history<CR>')
vim.keymap.set('n', '<leader>H', ':FzfLua oldfiles<CR>')
vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<CR>')
