" 需要放在 call plug#begin('~/vimfiles/autoload') 和 call plug#end() 之间

" gvim半透明
Plug 'mattn/vimtweak'

" gvim半透明
let g:transparency_ctermbg_none = 1
Plug 'tsuyoshicho/transparency.vim'
let g:transparency_config = {
      \  'active'   : 99,
      \  'inactive' : 70
      \ }

" 半透明主题
Plug 'tribela/vim-transparent'
let g:transparent_groups = ['Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']


" 颜色主题配置
Plug 'aonemd/quietlight.vim'
Plug 'rakr/vim-one'
Plug 'DAddYE/soda.vim'
Plug 'iandwelker/rose-pine-vim'
Plug 'aonemd/quietlight.vim'
Plug 'jacekd/vim-iawriter'
Plug 'overcache/NeoSolarized'
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

Plug 'lifepillar/vim-solarized8'
set termguicolors

Plug 'savq/melange'

Plug 'mcchrish/zenbones.nvim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sainnhe/everforest'
Plug 'ayu-theme/ayu-vim'

" 自定义颜色主题的补丁
Plug 'skywind3000/vim-color-patch'
let s:current_style_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:cpatch_path = s:current_style_path.'/color-patch'



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
	

"Mode Settings cursor光标设置

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)