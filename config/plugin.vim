" 需要放在 call plug#begin('~/vimfiles/autoload') 和 call plug#end() 之间

Plug 'drmikehenry/vim-fixkey'

" 搜索插件
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_search_mode = 'async'

" fuzzysearch 搜索插件
Plug 'ggVGc/vim-fuzzysearch'
let g:fuzzysearch_prompt = 'fuzzy /'
let g:fuzzysearch_hlsearch = 1
let g:fuzzysearch_ignorecase = 1
let g:fuzzysearch_max_history = 30
let g:fuzzysearch_match_spaces = 0


Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   }
\}

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" 注释
Plug 'tpope/vim-commentary'


"跳转
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
let g:qs_filetype_blacklist = ['dashboard', 'startify']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=#4B0082 gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=#DC143C gui=underline ctermfg=81 cterm=underline
augroup END


" 展示开始画面，显示最近编辑过的文件
Plug 'mhinz/vim-startify'

" 使用 :FlyGrep 命令进行实时 grep
let g:_spacevim_if_lua=0
Plug 'wsdjeg/FlyGrep.vim'

" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
Plug 'dyng/ctrlsf.vim'




" 配对括号和引号自动补全
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" nerdtree 文件夹目录
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
map <leader>b :NERDTreeToggle %<CR>
map <M-b> :NERDTreeToggle %<CR>

" nerdtree相关设置
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	

" 函数查看插件
Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'coc'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction


" statusline
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction',
	  \   'cocstatus': 'coc#status',
      \ },
      \ }

	
" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
" Plug 't9md/vim-choosewin'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate = { 'snippet_version' : 1 }

Plug 'honza/vim-snippets'

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" 定位光标
Plug 'axlebedev/vim-find-my-cursor'
" nnoremap <leader>c <CMD>FindCursor #657b83 500<CR>
noremap % %<CMD>FindCursor 0 500<CR>

" 快捷键显示
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
nnoremap <Space> :<c-u>WhichKey '<Space>'<CR>

" 在终端或者浏览器中打开当前文件
Plug 'justinmk/vim-gtfo'
let g:gtfo#terminals = { 'win': 'cmd.exe /k' }

" 编辑选中部分
Plug 'chrisbra/NrrwRgn'

" 自动保存
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "CursorHoldI"]


" 注释高亮
Plug 'jbgutierrez/vim-better-comments'

" 彩色括号
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


" 缩进颜色显示
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

augroup custom_vim_indent_highlight " 高亮颜色设置
  autocmd!
  autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guifg=#FFEBCD guibg=#FFEBCD   ctermbg=white
  autocmd VimEnter,Colorscheme * hi IndentGuidesEven guifg=#FFDAB9 guibg=#FFDAB9 ctermbg=lightgrey
augroup END

" 彩色代码块 RainbowLevelsToggle
Plug 'thiagoalessio/rainbow_levels.vim'
hi! RainbowLevel0 ctermbg=240 guibg=#585858
hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e
hi! RainbowLevel2 ctermbg=238 guibg=#444444
hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
hi! RainbowLevel4 ctermbg=236 guibg=#303030
hi! RainbowLevel5 ctermbg=235 guibg=#262626
hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
hi! RainbowLevel7 ctermbg=233 guibg=#121212
hi! RainbowLevel8 ctermbg=232 guibg=#080808

augroup custom_rainbow_highlight " 高亮颜色设置
  autocmd!
  au ColorScheme * highlight RainbowLevel0 ctermbg=240 guibg=#F0FFF0
  au ColorScheme * highlight RainbowLevel1 ctermbg=239 guibg=#F5FFFA
  au ColorScheme * highlight RainbowLevel2 ctermbg=238 guibg=#F0FFFF
  au ColorScheme * highlight RainbowLevel3 ctermbg=237 guibg=#F0F8FF
  au ColorScheme * highlight RainbowLevel4 ctermbg=236 guibg=#E6E6FA
  au ColorScheme * highlight RainbowLevel5 ctermbg=235 guibg=#FFF0F5
  au ColorScheme * highlight RainbowLevel6 ctermbg=234 guibg=#FFE4E1
  au ColorScheme * highlight RainbowLevel7 ctermbg=233 guibg=#87CEEB
  au ColorScheme * highlight RainbowLevel8 ctermbg=232 guibg=#87CEFA
augroup END

" 括号添加删除插件
Plug 'machakann/vim-sandwich'

""""""
" git相关
""""""

" commit插件 
Plug 'rhysd/committia.vim'

""""""
" 语言相关
""""""

Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}