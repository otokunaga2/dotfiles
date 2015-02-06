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
"    NeoBundle 'nathanaelkane/vim-indent-guides'
    "tagsの生成
    "NeoBundle 'alpaca-tc/alpaca_tags'
    NeoBundle 'szw/vim-tags'
call neobundle#end()

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
" 入力モードで開始する
let g:unite_enable_start_insert=1
" " バッファ一覧
noremap <C-U> :Unite buffer<CR>
" " ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

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

"alpaca( rails plugin's setting)
"augroup AlpacaTags
"autocmd!
"  if exists(':Tags')
"    autocmd BufWritePost Gemfile TagsBundle
"    autocmd BufEnter * TagsSet
"    " 毎回保存と同時更新する場合はコメントを外す
"    "     " autocmd BufWritePost * TagsUpdate
"  endif
"augroup END
"endif
"let g:snippet#disable_runtime_snippets = { "_": 1, }
"let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
"let g:neocomplete#enable_at_startup=1 "for startup with complete


" vim-tags
au BufNewFile,BufRead *.rb let g:vim_tags_project_tags_command = "ctags --languages=ruby -f ~/ruby.tags `pwd` 2>/dev/null &"
nnoremap <C-]> g<C-]> 

let g:hybrid_use_Xresources = 1
colorscheme hybrid
syntax on

" do not create the swapfile
set noswapfile
