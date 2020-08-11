"
" Basics
"
set nocompatible
set encoding=utf-8
set ruler
set number
set nowrap
set hidden
set wildmode=longest,full
" Use soft tabs.
set expandtab
set smarttab
" Set tab size to 2.
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Use case-insensitive search, except when the input has capital letters.
set ignorecase
set smartcase
" Customize viminfo.
" Store it and other vim-specific files in the ~/.vim directory.
set viminfo='100,f1,<50,s10,h,n~/.vim/viminfo
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//

"
" Plugins
"
set runtimepath+=/Users/jon/.vim/bundle/dein.vim/repos/github.com/Shougo/dein.vim
if dein#load_state('/Users/jon/.vim/bundle/dein.vim')
  call dein#begin('/Users/jon/.vim/bundle/dein.vim')

  " Let dein manage dein.
  call dein#add('/Users/jon/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Baseline
  call dein#add('tpope/vim-sensible') " sensible defaults
  call dein#add('Shougo/denite.nvim') " unite all interfaces
  call dein#add('Shougo/neocomplete.vim') " auto-complete
  call dein#add('Shougo/vimproc.vim') " async execution

  " Visual
  " #call dein#add('altercation/vim-colors-solarized') " colors
  call dein#add('vim-airline/vim-airline') " status line
  call dein#add('vim-airline/vim-airline-themes') " status line colors

  " Language-Specific
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('osyo-manga/vim-monster') " Ruby code completion
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('slim-template/vim-slim')
  call dein#add('digitaltoad/vim-jade')
  call dein#add('paulrex/yaml-vim')
  call dein#add('fatih/vim-go')

  " TODO: Explore these plugins later.
  " call dein#add('tpope/vim-commentary')

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  " On startup, install not-installed plugins.
  call dein#install()
endif

"
" Syntax Highlighting
"
filetype plugin indent on
syntax enable

"
" Colors
"
set background=dark

"
" Autocommands
"
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Trim trailing whitespace before saving code files.
  autocmd BufWritePre *.rb     :%s/\s\+$//e
  autocmd BufWritePre *.coffee :%s/\s\+$//e
  autocmd BufWritePre *.rake   :%s/\s\+$//e
  autocmd BufWritePre *.sass   :%s/\s\+$//e

  " Set filetypes for exotic extensions to get syntax highlighting.
  autocmd BufNewFile,BufRead *.hql        set filetype=sql
  autocmd BufNewFile,BufRead *.hql.erb    set filetype=eruby.sql
  autocmd BufNewFile,BufRead *.coffee.erb set filetype=eruby.coffee
endif

"
" Set up status bar.
"
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'bubblegum'

"
" Set up Denite.
"
call denite#custom#option('default', 'auto_highlight', 1)
call denite#custom#option('default', 'split',          "no")
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '--cached', '--others', '--exclude-standard', '--full-name'])
nnoremap <C-P> :<C-u>execute 'DeniteProjectDir' 'file_rec/git'<CR>

"
" Set up Neocomplete.
"
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 2 " Set minimum syntax keyword length.
let g:neocomplete#enable_auto_select = 1 " Behave like AutoComplPop.
let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>"] " Search from Neocomplete as well as Omni.

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Key Mappings
" <CR>: close popup and save indent.
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" <TAB>: close popup and save indent.
function! s:my_tab_function()
  return pumvisible() ? "\<C-y>" : "\<TAB>"
endfunction
inoremap <silent> <TAB> <C-r>=<SID>my_tab_function()<CR>
" <Space>: Cancel popup and keep going.
inoremap <expr><Space> pumvisible() ? "\<C-e>\<Space>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.python = ''
" Set up async completion for Ruby.
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"
" Set up vim-go.
"
if !exists("go_autocommands_loaded")
  let go_autocommands_loaded = 1
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>s <Plug>(go-implements)
endif
" Configure syntax-highlighting for functions, methods, and structs.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Automatically insert import paths as well.
let g:go_fmt_command = "goimports"

