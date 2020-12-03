call plug#begin('~/.vim/plugged')
"Plug 'fatih/vim-go'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Shougo/defx.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()


set number
set autoindent
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

"
" Define mappings for denite.nvim
" https://github.com/Shougo/denite.nvim
"
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space>
				\ denite#do_map('toggle_select').'j'
endfunction


nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>

function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction


" open buffer
function s:OpenReadOnly(target, name, body)
  execute a:target.' '.a:name
  setlocal buflisted modifiable modified noreadonly
  cal append(line('^'), split(a:body, '\n'))
  silent! $d
  setlocal noswapfile nobuflisted buftype=nofile bufhidden=unload
  setlocal nomodifiable nomodified readonly
  setlocal nonumber nobinary nolist
  execute 'normal! 1G'
endfunction

function s:OpenReadOnlyTab(type, name, body)
  cal s:OpenReadOnly('tabnew!', a:name, a:body)
endfunction

function s:OpenReadOnlyBuffer(type, name, body)
  cal s:OpenReadOnly(a:type =~# '^\(v\|vert\)' ? 'vsplit!' : 'split!', a:name, a:body)
endfunction

function s:GoDoc(bang, args)
  let arg = join(split(a:args), '.')
  silent! let res = system('go doc -cmd -all '.arg.' 2>/dev/null')
  if v:shell_error != 0
    let err = systemlist('go doc '.arg.' 1>/dev/null')
    echohl ErrorMsg | echomsg err | echohl None
    return
  endif
  if a:bang == '!'
    call s:OpenReadOnlyTab('' , arg, res)
  else
    call s:OpenReadOnlyBuffer('' , arg, res)
  endif
  setlocal ft=godoc
  nnoremap <buffer> <silent> q :q<cr>
endfunction
function! s:CompleteGoDoc(arg_lead, cmdline, cursor_pos)
    return filter(copy(s:GoList()), 'stridx(v:val, a:arg_lead)==0')
endfunction
command -nargs=1 -bang -complete=customlist,s:CompleteGoDoc GoDoc cal s:GoDoc('<bang>', <f-args>)

" CtrlPGoDoc
" depending the s:GoDoc above
command! CtrlPGoDoc cal ctrlp#init(ctrlp#godoc#id())
nnoremap <c-e>g :<c-u>CtrlPGoDoc<cr>

augroup GoOptions
  autocmd!
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err[0-9]*\>/
augroup END
