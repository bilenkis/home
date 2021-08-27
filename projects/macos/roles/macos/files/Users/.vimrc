""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'hashivim/vim-terraform'
Plug 'pixelastic/vim-undodir-tree'
Plug 'maxbrunsfeld/vim-yankstack'

" terminal coloscheme
Plug 'vim-scripts/CSApprox'
" automatic closing of quotes, parenthesis, brackets
Plug 'Raimondi/delimitMate'
" syntax & linter check
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/vim-jsonnet'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

call plug#end()

filetype plugin indent on    " required

""""""""""""""""""""""""""""""
" Basic Setup
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
" NERDTree
""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.sw.$']
let NERDTreeShowHidden=1
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>gg :NERDTreeFind<CR>
let g:NERDTreeWinSize=40

""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""
"nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>b :Telescope buffers<CR>
" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
"let g:fzf_preview_window = ''
nmap <silent> <Leader>e :Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>

""""""""""""""""""""""""""""""
" Fzf
""""""""""""""""""""""""""""""
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/" --glob "!.terraform/" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
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
"nmap <leader>f :Find <c-r><CR>
nmap <leader>f :Telescope grep_string <c-r><CR>
nmap <leader>F :Telescope grep_string <c-r>=expand("<cword>")<CR><CR>

"command! -bang -nargs=* History call fzf#vim#command_history()
"nmap <leader>h :History <CR>
nmap <leader>h :Telescope command_history<CR>


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
"set updatetime=1000  " save every 1 sec
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_silent = 1  " do not display the auto-save notification

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

" vim-fugitive
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :G<CR>
nnoremap <space>gc :G commit -v -q<CR>
nnoremap <space>gt :G commit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

""""""""""""""""""""""""""""""
" My additional customizations
""""""""""""""""""""""""""""""
set expandtab softtabstop=2 shiftwidth=2 tabstop=2
set paste
set history=10000        " keep lines of command line history

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

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l



" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap <silent> <Leader>e :Telescope find_files<CR>

" yank or paste file to/from clipboard
noremap <Leader>y "*y
noremap <Leader>Y :%y*<CR>
noremap <Leader>p "*p


