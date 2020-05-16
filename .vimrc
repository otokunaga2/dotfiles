call plug#begin('~/.vim/plugged')
"Plug 'fatih/vim-go'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Async completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'sebdah/vim-delve'
Plug 'tomasr/molokai'
call plug#end()


set number
autocmd FileType go nmap <silent> ;d :DlvToggleBreakpoint<CR>

"Check whether plugin exists
"#Reference thanks to https://ryochack.hatenablog.com/entry/2017/04/08/162354ng 
function s:is_plugged(name)
	if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
		return 1
	else 
		return 0
	endif
endfunction

if s:is_plugged('molokai')
 colorscheme molokai
endif

syntax on
set t_Co=256
