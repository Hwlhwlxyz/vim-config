" 需要放在 call plug#begin('~/vimfiles/autoload') 和 call plug#end() 之间

" Plug 'puremourning/vimspector'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" python
let g:vimspector_install_gadgets = [ 'debugpy' ]