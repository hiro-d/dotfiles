"------------------------------------
" NeoBundle settings
"------------------------------------
"
filetype plugin on
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'


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

let g:neocomplcache_snippets_directory = "~/.vim/snippets"
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

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"

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
"ソフトタブ
set expandtab       
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
set fileencodings=iso-2022-jp,cp932,euc-jp,Shift_JIS


