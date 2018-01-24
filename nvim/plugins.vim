" Plugins
" Vim-plug as plugin manager
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linting with ALE
Plug 'w0rp/ale'

" Colorschemes
Plug 'flazz/vim-colorschemes'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Initialize plugin system
call plug#end()
