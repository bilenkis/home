vim.opt.guicursor = ""

-- test

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.g.mapleader = " "

-- Set default clipboard to the system one
vim.opt.clipboard = 'unnamedplus'

vim.opt.history = 10000

-- Name a tab with the current directory
vim.opt.title = true
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Autosave
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd('Neoformat')
    vim.lsp.buf.format { async = true }
  end
})

vim.api.nvim_create_autocmd({ "FocusLost", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    -- vim.cmd('silent update | Neoformat')
    vim.cmd('silent update')
    -- vim.lsp.buf.format { async = true }
  end
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  callback = function()
    if not vim.bo.readonly then
      -- vim.cmd('silent update | Neoformat')
      -- vim.cmd('silent update | undojoin | Neoformat')
      vim.cmd('silent update')
      -- vim.lsp.buf.format { async = true }
    end
  end
})

-- Disable default VIM filetype detection mechanism and use NVIM's one only
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

vim.opt.completeopt = "menu,menuone,noselect"
