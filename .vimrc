"行番号を表示
set number
"インデントの深さを設定
set tabstop=2
set expandtab
set shiftwidth=2
set encoding=utf-8

set nocompatible  

filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
    " originalrepos on github
    NeoBundle 'Shougo/neobundle.vim'
    "vim内でスクリプトをはしらせる
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'VimClojure'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'szw/vim-tags'
    NeoBundle 'Shougo/vimshell'
    NeoBundle 'Shougo/unite.vim'
"    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'bbatsov/rubocop'
    "A simple Vim plugin to switch segments of text with predefined replacements
    NeoBundle 'AndrewRadev/switch.vim'
    "support 
    NeoBundle 'https://github.com/basyura/twibill.vim'
    NeoBundle 'w0ng/vim-hybrid'
    NeoBundle 'bbatsov/rubocop'
    " ファイルオープンを便利に
    NeoBundle 'Shougo/unite.vim'
    " Unite.vimで最近使ったファイルを表示できるようにする
    NeoBundle 'Shougo/neomru.vim'
    " ファイルをtree表示してくれる
    NeoBundle 'scrooloose/nerdtree'
    " Rails向けのコマンドを提供する
    NeoBundle 'tpope/vim-rails'
    " Ruby向けにendを自動挿入してくれる
    NeoBundle 'tpope/vim-endwise'
    " コメントON/OFFを手軽に実行
    NeoBundle 'tomtom/tcomment_vim'
    " インデントに色を付けて見やすくする
    NeoBundle 'nathanaelkane/vim-indent-guides'
endif

"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
end

let g:snippet#disable_runtime_snippets = { "_": 1, }
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
let g:neocomplete#enable_at_startup=1 "for startup with complete

let g:hybrid_use_Xresources = 1
colorscheme hybrid
syntax on
