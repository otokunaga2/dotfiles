"行番号を表示
set number
"インデントの深さを設定
set tabstop=2
set expandtab
set shiftwidth=2
"encodingをutf8に設定
set encoding=utf-8
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
set nocompatible  
filetype off


if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
    "call neobundle#rc(expand('~/.vim/bundle/'))
    call neobundle#begin(expand('~/.vim/bundle/'))
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
    "NeoBundle 'alpaca-tc/alpaca_tags'
    NeoBundle 'szw/vim-tags'
    NeoBundle 'fatih/vim-go'
call neobundle#end()



" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
" 入力モードで開始する
let g:unite_enable_start_insert=1
" " バッファ一覧
noremap <C-U> :Unite buffer<CR>
" " ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" " no highlight
noremap <Esc><Esc> :noh
"  
"  " ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"  " ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"  " ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"  " 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
   " Overwrite settings.
endfunction
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
end

"golang highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"golang err highlight
autocmd Filetype go :highligh goErr cterm=bold ctermfg=214
autocmd Filetype go :match goErr /<err/>/


" vim-tags
au BufNewFile,BufRead *.rb let g:vim_tags_project_tags_command = "ctags --languages=ruby -f ~/ruby.tags `pwd` 2>/dev/null &"
nnoremap <C-]> g<C-]> 

let g:hybrid_use_Xresources = 1
colorscheme hybrid
syntax on

" do not create the swapfile
set noswapfile
