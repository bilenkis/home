""""""""""""""""""""""""""""""
" My custom options
""""""""""""""""""""""""""""""
let mapleader=" "
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
" disable bell on error
set t_vb=

" edit file if it's opened anyway
autocmd SwapExists * let v:swapchoice = "e"

" Remove trailing whitespaces before save
autocmd BufWritePre * %s/\s\+$//e

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'tag': '5.0.0' }
Plug 'scrooloose/nerdcommenter'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-fugitive'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'pgr0ss/vim-github-url'
Plug 'google/vim-jsonnet'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
call plug#end()


""""""""""""""""""""""""""""""
" Disabled for Vundle install
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
execute pathogen#infect()
""""""""""""""""""""""""""""""
" Vundle start
""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'hashivim/vim-terraform'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin '907th/vim-auto-save'
Plugin 'pixelastic/vim-undodir-tree'
Plugin 'maxbrunsfeld/vim-yankstack'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
""""""""""""""""""""""""""""""
" Vundle end
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.sw.$']
let NERDTreeShowHidden=1
nmap <silent> <Leader>t :NERDTreeToggle<CR>
nmap <silent> <Leader>n :NERDTreeFind<CR>
let g:NERDTreeWinSize=40

""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""
nmap <silent> <Leader>e :Buffers<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ''
nmap <silent> <Leader>b :FZF<CR>


""""""""""""""""""""""""""""""
" Fzf
""""""""""""""""""""""""""""""
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/" --glob "!.terraform/" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
nmap <leader>f :Find <c-r><CR>
nmap <leader>F :Find <c-r>=expand("<cword>")<CR><CR>

command! -bang -nargs=* History call fzf#vim#command_history()
nmap <leader>h :History <CR>


""""""""""""""""""""""""""""""
" Ansible
""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.yml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *.yaml set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

""""""""""""""""""""""""""""""
" Jsonnet
""""""""""""""""""""""""""""""
let g:jsonnet_fmt_on_save = 0
let g:jsonnet_fmt_fail_silently = 0


""""""""""""""""""""""""""""""
" Pymode
""""""""""""""""""""""""""""""
let g:pymode_breakpoint_bind = '<leader>v'
let g:pymode_options_max_line_length = 150
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 0
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
autocmd BufNewFile,BufRead *.go setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

""""""""""""""""""""""""""""""
" vim-undodir-tree
""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undodir

""""""""""""""""""""""""""""""
" vim-auto-save
""""""""""""""""""""""""""""""
set updatetime=1000  " save every 1 sec
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

"""""""""""""""""""""""""""""
" gruvbox
"""""""""""""""""""""""""""""
colorscheme gruvbox
syntax enable
set textwidth=0
set background=dark
set termguicolors

""""""""""""""""""""""""""""""
" From grml .vimrc
""""""""""""""""""""""""""""""
set backspace=indent,eol,start        " more powerful backspacing
set nobackup          " Don't keep a backup file
set noswapfile        " Don't create a swap file
" When switching between different buffers you can't use undo without 'set hidden':
set hidden            " Hide buffers when they are abandoned
set mouse=            " Disable mouse usage (being "a" AKA all modes in Vim >=8) in terminals
set wildmenu          " command-line completion operates in an enhanced mode

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags,../../../tags,../../../../tags

" set maximum number of suggestions listed top 10 items:
if version >= 700
  set sps=best,10
endif

""""""""""""""""""""""""""""""
" My additional customizations
""""""""""""""""""""""""""""""
set expandtab softtabstop=2 shiftwidth=2 tabstop=2
set paste
set history=10000        " keep lines of command line history

" yank or paste file to/from clipboard
noremap <Leader>y "*y
noremap <Leader>Y :%y*<CR>
noremap <Leader>p "*p

" cd to current file's dir
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" show relative line numbers
set relativenumber

" show lines above the cursor
set scrolloff=10

set autoindent
set smartindent

" Show hidden characters, tabs, trailing whitespace
"set list
"set listchars=tab:→\ ,trail:·,nbsp:·
set autoread
au FocusGained,BufEnter,CursorHold * checktime

nmap <leader>v <Plug>yankstack_substitute_older_paste
nmap <leader>V <Plug>yankstack_substitute_newer_paste
