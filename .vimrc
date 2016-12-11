
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
  "管理するプラグインを記述したファイル
  let s:toml = '~/.dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

call dein#end()

if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

if dein#check_install()
  call dein#install()
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


"encoding
set encoding=utf8

" molokai
syntax on
colorscheme molokai
highlight Normal ctermbg=none
let g:molokai_original = 1
let g:rehash256 = 1

" vim-go
let g:go_fmt_command = "goimports"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim
set title
set noshowmode
set number
" ruby
set tabstop=2
set autoindent
set expandtab
" ruby
set shiftwidth=2

" Enable filetype plugins
filetype plugin on
"
let g:vimfiler_as_default_explorer = 1
