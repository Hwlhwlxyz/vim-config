" snip 代码片段 插件
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

let g:vsnip_snippet_dir='~\vimfiles\autoload\vim-snippets\snippets'

"vsnip#get_context()


" 高亮snippetmate可以补全的代码
augroup custom_highlight " 高亮颜色设置
  autocmd!
  au ColorScheme * highlight InputWordMatch ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71
  au InsertEnter * highlight InputWordMatch ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71
augroup END


function! GetCharactersFromLastSpaceToCursor()
    let cursor_pos = getpos('.')
    let line = getline('.')
    let characters = ''
    for i in range(cursor_pos[2] - 1, 0, -1)
        let char = strpart(line, i - 1, 1)
        if char =~ '\s'
            break
        endif
        let characters = char . characters
    endfor
    
    return characters
endfunction


function! MyGetCharactersFromLastSpaceToCursor()
    let cursor_pos = getpos('.')
    let line = getline('.')
    let characters = ''
	let cursorLastSpaceLength = 0
    for i in range(cursor_pos[2] - 1, 0, -1)
		let cursorLastSpaceLength = cursorLastSpaceLength+1
        let char = strpart(line, i - 1, 1)
        if char =~ '\s'
            break
        endif
        let characters = char . characters
    endfor
    return cursorLastSpaceLength
endfunction


function! HighlightFromLastSpaceToCursor()
    let last_space = search('\s', 'bcnW')
    if last_space > 0
        let end_pos = col('.')
        call matchadd('InputWordMatch', '\%>'.last_space.'c\%<'.end_pos.'c')
    endif
endfunction

function! VsnipExpandableDisplay() " 匹配和高亮
	let ch = matchstr(getline('.'), '\%' . col('.') . 'c.')
	let i = (a:0 ? a:1 : mode() ==# 'i' || mode() ==# 'R') && col('.') > 1
	let line = getline('.')
	let word = GetCharactersFromLastSpaceToCursor()
	if vsnip#expandable()
		echo 'vsnip:' . word
		let word_first_length = MyGetCharactersFromLastSpaceToCursor()
		let end = col('.')
		let start = end-word_first_length
		exec 'match' 'InputWordMatch' ' /\%'.line('.').'l' . '\%>' .start. 'c\%<' .end. 'c/'
	else
		match none
	endif
endfunction

autocmd! TextChangedI * call VsnipExpandableDisplay()