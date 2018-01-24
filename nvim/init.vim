" Neovim config
    " Inspired by: http://nerditya.com/code/guide-to-neovim/

" TODO
    " Python linting
    " Easy shortcuts to use system clipboard
    " Cheatsheet
    " Numbering of tabs
    " Fix issue in paste mode and commenting
    " Fix colorscheme within screen
    " Find shortcut for native completion (<C-X>)
    " Fix issue with clearing search highlighting
    " Check whether textwidth=80 setting is convenient
    " Add shortcuts for navigating between lint errors and warnings

source $HOME/.config/nvim/plugins.vim
"source $XDG_CONFIG_HOME/nvim/filebrowsing.vim
source $HOME/.config/nvim/finding.vim

" Basics
    set nocompatible        " Enter the current millenium
    set undofile            " Maintain undo history between sessions
    set showmatch           " Show matching brackets.
    set relativenumber      " Show the line numbers on the left side relative to current line
    set ruler
    "set number              " Show number ruler
    set cursorline          " Highlight the current line for the cursor
    " set lazyredraw          " Keep scrolling speedy
    set formatoptions+=o    " Continue comment marker in new lines.
    "set textwidth=0         " Hard-wrap long lines as you type them.
    set expandtab           " Insert spaces when TAB is pressed.
    set tabstop=2           " Render TABs using this many spaces.
    set shiftwidth=2        " Indentation amount for < and > commands.
    set textwidth=80
    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
    set title               " Change the terminal's title
    set visualbell          " don't beep
    set noerrorbells        " don't beep
    set encoding=utf8
    set mouse=a
    set hidden

    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    if &listchars ==# 'eol:$'
      set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    set list                " Show problematic characters.

    " Jump to the last position when reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
    endif

"    syntax enable
"    filetype plugin on

" Shortcuts
    " Habit breaking, habit making:
    " Disable those arrow keys
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>

    " Map leader
    let mapleader = " "
    " Use ; for commands.
    nnoremap ; :
    " Use Q to execute default register.
    nnoremap Q @q
    " Temporarily switch to paste mode
    set pastetoggle=<F2>

    " If you like long lines with line wrapping enabled, this solves the
    " problem that pressing down jumpes your cursor “over” the current line to
    " the next line. It changes behaviour so that it jumps to the next row in
    " the editor (much more natural)
    nnoremap j gj
    nnoremap k gk

    " Center the screen quickly
    map <leader>z zz

    " Use tab to switch between tabs
    "map <Tab> gt
    map <Tab> :bn<cr>

    " Make moving lines easy
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
    nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    " nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
    " nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Splitting
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.

    " Creating splits
    nnoremap <leader>v :vsplit<cr>
    nnoremap <leader>h :split<cr>

    " Closing splits
    nnoremap <leader>q :close<cr>

    " Easy window navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Search
    set ignorecase          " Make searching case insensitive
    set smartcase           " ... unless the query has capital letters.
    set gdefault            " Use 'g' flag by default with :s/foo/bar/.
    set magic               " Use 'magic' patterns (extended regular expressions).

    " Use <C-L> to clear the highlighting of :set hlsearch.
    " if maparg('<C-L>', 'n') ==# ''
      nnoremap <silent> <C-S> :nohlsearch<CR><C-S>
    " endif

" Completion
    " YouCompleteMe

" Plugin specific settings
    " Airline
    let g:airline_theme='behelit'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

    " ALE. Airline will handle the rest.
    let g:airline#extensions#ale#enabled = 0

    let g:ale_lint_on_text_changed = 'normal'

" Coloring
    "Credit joshdick
    "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
      if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        set termguicolors
      endif
    endif
    set background=dark

    colorscheme molokai
