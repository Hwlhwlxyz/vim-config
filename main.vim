" reference: skywind skywind3000/vim-init
"==========================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if has('win16') || has('win95') || has('win32') || has('win64')
    " 定义一个命令用来加载文件
	command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'
else
    " windows的路径
	command! -nargs=1 LoadScript exec 'so '.s:home.'\'.'<args>'
endif





" 将 vim-init 目录加入 runtimepath
" exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

"======================================================================
"
" init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
"
" 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 16:53:18
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler


"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif

" 折叠
" set foldmethod=syntax
" set foldlevelstart=99

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" 设置tab和缩进
set tabstop=4
set shiftwidth=4 
set noexpandtab " tab是否展开成空格
set softtabstop=4 " 方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
set nosmarttab " 开启时，在行首按TAB将加入sw个空格，否则加入ts个空格。 
set autoindent  


" python缩进设置
augroup PythonTab
	au!
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab autoindent
augroup END


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 备份文件地址，统一管理
set backupdir=~/.vim/tmp

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
set noswapfile

" 禁用 undo文件
set noundofile

" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)


"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 总是显示状态栏
" set laststatus=2

" 总是显示行号
set number

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
" set signcolumn=yes

" 总是显示标签栏
" set showtabline=2

" 设置显示制表符等隐藏字符
set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面显示 -- INSERT --，
" 先注释掉，默认已经为真了，如果这里再设置一遍会影响 echodoc 插件
" set showmode

" 水平切割窗口时，默认在右边显示新窗口
set splitright

LoadScript config\keymaps.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/vimfiles/autoload')
LoadScript config/plugin.vim
LoadScript config/plugin-cocnvim.vim
" LoadScript config/plugin-python.vim
LoadScript config/style.vim
LoadScript config/my-functions.vim
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""

" windows下添加python支持 可以输入 :py3 print("hello") 来测试
"let &pythonthreedll = 'C:\Python38\python38.dll'


"自定义设置
set guifont=dejavu_sans_mono:h18
" 如果windows下没有安装字体，可以先用这个，或者在gvim下输入set guifont=*
" set guifont=Consolas:h18



function! MyHighlights() abort
    "highlight Normal guifg=black
	"au ColorScheme * highlight Normal guifg=black
	au ColorScheme * highlight Identifier guifg=#d33682
endfunction

" 对某个主题改动其中部分设置
augroup MyColors
    autocmd!
    autocmd ColorScheme solarized8_high call MyHighlights()
augroup END

colorscheme solarized8_high
set background=light

"高亮显示当前行"
set cursorline
" hi cursorline guibg=#F8F8F0
"高亮显示当前列"
"set cursorcolumn
"hi CursorColumn guibg=#F8F8F0

"启动提示跳过按enter继续 和跳过打开的提示
set shortmess=aI
set cmdheight=2

set mouse=a

"""""""""""""""""""""""""""""""
" 高亮snippetmate可以补全的代码
augroup custom_highlight " 高亮颜色设置
  autocmd!
  au ColorScheme * highlight InputWordMatch ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71
  au InsertEnter * highlight InputWordMatch ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71
augroup END

function! GetInputHighlightList() abort " 获取触发单词列表
	if len(g:input_highlight_list)==0
		let list = snipMate#GetSnippetsForWordBelowCursor('', 0)
		for l in list
			let f = l[0]
			call add(g:input_highlight_list, f) 
		endfor
		"echom g:input_highlight_list
	endif
endfunction

autocmd! BufReadPost,BufNewFile   * call timer_start(200, { tid -> execute('call GetInputHighlightList()')})

let g:input_highlight_list = []

function! HighlightSnippetWordUnderCursor() abort " 匹配和高亮
	" let word    = matchstr(getline('.'), '\S\+\%' . col('.') . 'c')
	" let word = expand('<cword>')
	let ch = matchstr(getline('.'), '\%' . col('.') . 'c.')
	let i = (a:0 ? a:1 : mode() ==# 'i' || mode() ==# 'R') && col('.') > 1
	let line = getline('.')
	let word = matchstr(line[:(col('.')-i-1)], '\k*$') . matchstr(line[(col('.')-i-1):], '^\k*')[1:]
	echo word
	"echom word=="fun"
	if index(g:input_highlight_list, word) >= 0
		" echo word
		exec 'match' 'InputWordMatch'  ' /\%'.line('.').'l' . word . '/' 
	else
		match none
	endif
endfunction

autocmd! InsertCharPre,TextChanged,TextChangedP,TextChangedI * call HighlightSnippetWordUnderCursor()


"""""""""""""""""""""""""""""""
