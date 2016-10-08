"行番号を表示
set number
"インデントの深さを設定
set tabstop=2
set smarttab
"tabをスペースに設定
set expandtab
set noswapfile
set expandtab
set shiftwidth=2
"encodingをutf8に設定
set encoding=utf-8
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set autoindent
set smartindent
"set nocompatible  
filetype off
syntax on
"vim内のコーディングに関してはutf-8に設定
set encoding=utf-8
"コピペでインデントを崩さない
"set paste

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  "code indent as Ruby style
  NeoBundle 'vim-ruby/vim-ruby'
  "setting for :Rails model
  NeoBundle 'tpope/vim-rails'
  "setting for view list Unite
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'basyura/unite-rails'
  "quick run
  NeoBundle 'thinca/vim-quickrun'
  "auto save
  NeoBundle 'vim-scripts/vim-auto-save'
  "Yet another gitk clone for Vim!
  NeoBundle 'cohama/agit.vim'
  "Open URI with your favorite browser from your most favorite editor
  NeoBundle 'tyru/open-browser.vim'
  "Opens GitHub URL of current file, etc. from Vim 
  NeoBundle 'tyru/open-browser-github.vim'
  "Github Flavor markdown prevew
  NeoBundle 'kannokanno/previm'
  "vim interface to Web API
  NeoBundle 'mattn/webapi-vim'
  "Gist plugin(dependent web api)
  NeoBundle 'mattn/gist-vim'
	"Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more.
  NeoBundle 'tpope/vim-surround'
  "Erlang indentation and syntax for Vim https://vim-erlang.github.io
  NeoBundle "vim-erlang/vim-erlang-runtime"
  NeoBundle 'elixir-lang/vim-elixir'
  "setting for elixir
call neobundle#end()
"autosave enable(you don't have to command :wq)
let g:auto_save=1
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"plugin for ruby

"------------------------------------
"mapping as easy regular expression
"------------------------------------
nmap / /\v
imap >> \|><Space>
"------------------------------------
" vim-rails
"------------------------------------
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
function! SetUpRailsSetting()
	nnoremap <buffer><Space>r :R<CR>
	nnoremap <buffer><Space>a :A<CR>
	nnoremap <buffer><Space>m :Rmodel<Space>
	nnoremap <buffer><Space>c :Rcontroller<Space>
	nnoremap <buffer><Space>v :Rview<Space>
	nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
	au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
	au!
aug END

"quickrunの実行をbundle execに置き換える方法
"let g:quickrun_config['ruby.bundle'] = { 'command': 'ruby', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }

"------------------------------------
" Unite-rails.vim
""------------------------------------
"function! UniteRailsSetting()
"	nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
"	nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
"	nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>
"
"	nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
"	nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
"	nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
"	nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
"	nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
"	nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
"	nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
"	nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
"	nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
"endfunction
"}}}
let g:quickrun_config={'*': {'split': ''}}

"英語のスペルチェックを有効にする
set spelllang=en,cjk
"Gitのコミット時に自動でスペルチェックを有効にする
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit startinsert

"Vimからmanを参照するためのコマンド
runtime ftplugin/man.vim
nnoremap gc :<C-u>!git<space>


"------------------------------------
" (plugin)OpenBrowser setting
" github管理下のファイル上でgoとノーマルモードで入力すると
" GitHubページを開くことができる
"------------------------------------
nnoremap go :<C-u>OpenGithubFile<CR>
xnoremap go :OpenGithubFile<CR>


"------------------------------------
" (plugin)Gist setting
" commands
" - post関連
" :Gist => publicなgistとしてアップロード
" :Gist -p privateなgistとしてアップロード
" :Gist -a 匿名ユーザで投稿
" :Gist -m Vimで開いているすべてのバッファのファイルを一度にアップロード
" - 閲覧系
" :Gist -l 自分のuploadしたgist
" :Gist -ls startをつけたgist一覧
" :Gist -l ユーザ名 ユーザ名さんのアップロードしたgist一覧
"------------------------------------
"for linux
"let g:gist_cliip_command = 'xclip -selection clipboard'
"for mac
let g:gist_cliip_command = 'pbcopy'
"upload時にブラウザで開きたい場合
let g:gist_open_browser_after_post = 1
"w!でgist更新
let g:gist_update_on_write = 2
" for erlang
"------------------------------------

