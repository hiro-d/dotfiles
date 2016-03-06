"------------------------------------
" NeoBundle settings
"------------------------------------
"
set nocompatible
filetype off
set rtp+=~/dotfiles/neobundle.vim

if has ('vim_starting')
  set runtimepath+=~/dotfiles/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mrk21/yaml-vim'

filetype plugin indent on

"------------------------------------
" neocomplcache
"------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

"let g:neocomplcache_snippets_directory = "~/.vim/snippets"
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
  \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


"------------------------------------
" neosnippet
"------------------------------------

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_start_unite_snippet_target)

"SuperTab like snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
\ "\<Plug>(neosnippet_expand_or_jump)" 
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
\ "\<Plug>(neosnippet_expand_or_jump)" 
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"------------------------------------
" quickrun
"------------------------------------
"
" \rでPerl実行
nmap <Leader>r <Plug>(quickrun)

"------------------------------------
" basic seetings
"------------------------------------

"" edit settings
set autoindent		
set cindent         
set showmatch		
"上行末尾の文字を１文字消去
set backspace=2		
"<Tab>の空白数
set tabstop=4       
"インデント幅
set shiftwidth=4	

"" display settings
" ,nで行表示トグル切り替え
if version >= 703
  nnoremap <silent> ,n :<C-u>ToggleNumber<CR>
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
    else
      set number
    endif
  endfunction
endif
set number
set title
set ruler
set laststatus=2
syntax on           
set cursorline
set cursorcolumn
set showcmd     " 入力中コマンド表示
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t    set filetype=perl

" html用設定
au BufRead,BufNewFile,BufReadPre *.html   set filetype=html
autocmd FileType html    setlocal sw=2 sts=2 ts=2 et

"" search setting
set incsearch		
set hlsearch        
set ignorecase		
" 大文字がある時のみ、大小文字を区別しない
set smartcase       

" clipboard
set clipboard+=unnamed	  
set clipboard+=autoselect 

"" color scheme
colorscheme desert

"" key mappings

let g:BASH_Ctrl_j = 'off' " ターミナルでしかきかない？
inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap <C-d> $
inoremap <C-a> @
inoremap <C-p> %

"" encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,Shift_JIS


