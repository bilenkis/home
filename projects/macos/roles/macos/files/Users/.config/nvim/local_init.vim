"""""""""""""""""""""""""""""
" gruvbox
"""""""""""""""""""""""""""""
syntax enable
set textwidth=0
set background=dark
set termguicolors

"""""""""""""""""""""""""""""
" vim-coc
"""""""""""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

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
  inoremap <silent><expr> <c-tab> coc#refresh()
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
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
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


""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=0
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>gg :NERDTreeFind<CR>
let g:NERDTreeWinSize=40
let g:nerdtree_tabs_open_on_console_startup=0

""""""""""""""""""""""""""""""
" vim-telescope
""""""""""""""""""""""""""""""
" nnoremap <silent> <Leader>n :Telescope file_browser<CR>
" nnoremap <silent> <Leader>e :Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
" nnoremap <silent> <leader>b :Telescope buffers<CR>
" nnoremap <leader>f :Telescope grep_string <c-r><CR>
" nnoremap <leader>F :Telescope grep_string <c-r>=expand("<cword>")<CR><CR>
" nmap <leader>F :Telescope grep_string search=<C-R><C-W><CR>

""""""""""""""""""""""""""""""
" ripgrep
""""""""""""""""""""""""""""""
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!.terraform/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!.terraform/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

nmap <leader>f :Find <c-r><CR>
nmap <leader>F :Find <c-r>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
" let g:go_fmt_experimental = 1

""""""""""""""""""""""""""""""
" vim-terraform
""""""""""""""""""""""""""""""
let g:terraform_fmt_on_save = 1

""""""""""""""""""""""""""""""
" vim-undodir-tree
""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undodir

""""""""""""""""""""""""""""""
" vim-rhubarb
""""""""""""""""""""""""""""""
" open current line on GitHub
nnoremap <leader>gB :.GBrowse<CR>

""""""""""""""""""""""""""""""
" Jsonnet
""""""""""""""""""""""""""""""
let g:jsonnet_fmt_on_save = 1
let g:jsonnet_fmt_fail_silently = 0

""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""
nnoremap <leader>ga :G add %:p<CR><CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :G commit -v -q<CR>
nnoremap <leader>gca :G commit -v -q --all<CR>
nnoremap <leader>gt :G commit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :bot Gclog<CR>:bot copen<CR>
nnoremap <leader>gp :G push origin @<CR>
nnoremap <leader>gP :G push -f origin @<CR>
nnoremap <leader>gm :G diff master<CR>
nnoremap <leader>go :Dispatch! git pull --verbose --no-rebase --autostash origin $(basename $(git symbolic-ref refs/remotes/origin/HEAD))<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gcb :G checkout --track -b<Space>
nnoremap <leader>gco :G checkout<Space>
nnoremap <leader>gfa :Dispatch! git fetch --all --prune --jobs=10<CR>
nnoremap <leader>gup :Dispatch! git fetch --all --prune --jobs=10 && git pull --no-rebase --verbose --autostash origin $(git branch --show-current)<CR>

"""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 0
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
let g:airline_section_x  = ''
let g:airline_section_y  = ''

"""""""""""""""""""""""""""""
" fix vim-bootstrap
"""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 0
let no_buffers_menu=0
set expandtab softtabstop=2 shiftwidth=2 tabstop=2
set history=10000        " keep lines of command line history
set relativenumber
set scrolloff=10
set autoread
set nohlsearch
cunmap <C-P>
let loaded_delimitMate = 0

" autosave
inoremap <silent><esc> <esc>:update<cr>
autocmd BufWritePre * :FixWhitespace
autocmd TextChanged,FocusLost,BufEnter * silent update
" always open a file in the write mode
autocmd SwapExists * let v:swapchoice = "e"
