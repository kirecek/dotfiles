" NVIM configuration file

" ========================================================= RC init
runtime! plugin/sensible.vim

" be iMproved
set nocompatible

" required for plugin manager initialization
filetype off

" set encoding
set encoding=utf-8

" ========================================================= VIM-PLUG

call plug#begin('~/.plugged')

" fancy statusbar
Plug 'git@github.com:vim-airline/vim-airline.git'

" colorscheme: onedark
Plug 'git@github.com:joshdick/onedark.vim.git'

" airline_theme: onedark
Plug 'git@github.com:joshdick/airline-onedark.vim.git'

" syntax highlight for JSX
Plug 'git@github.com:mxw/vim-jsx.git'

" nerdtree -> tree style navigation panel
Plug 'git@github.com:scrooloose/nerdtree.git'

" emmet -> impove html and css workflow
Plug 'git@github.com:mattn/emmet-vim.git'

" improved javascript highlinghting
Plug 'pangloss/vim-javascript'

" autoclose brackets
Plug 'jiangmiao/auto-pairs'

" visualy display indent levels
Plug 'nathanaelkane/vim-indent-guides'

" motion plugin
Plug 'justinmk/vim-sneak'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" autocomplete
" Plug 'Valloric/YouCompleteMe', { 'dir': '~/.plugged/YouCompleteMe', 'do': './install.py --all' }

" autocompletion for python
Plug 'davidhalter/jedi-vim'

" colorfull parentheses
Plug 'luochen1990/rainbow'

" pep-8 style checker
Plug 'nvie/vim-flake8'

" add rust syntax support
Plug 'rust-lang/rust.vim'

" measure your coding time
Plug 'wakatime/vim-wakatime'

" colorscheme: deep-space
Plug 'tyrannicaltoucan/vim-deep-space'

" multicursor plugin
Plug 'terryma/vim-multiple-cursors'

" yml syntax
Plug 'stephpy/vim-yaml'

" nginx syntax
Plug 'evanmiller/nginx-vim-syntax'

" one colorscheme
Plug 'rakr/vim-one'

" Add plugins to &runtimepath
call plug#end()

" ========================================================= Autocompletion

" autoclose preview window
let g:ycm_autoclose_preview_window_after_completion=1

" ========================================================= Rust

" enable automatic running of :RustFmt
" let g:rustfmt_autosave = 0

" ========================================================= Sneak

" enable vim-sneak
let g:sneak#streak = 1

" ========================================================= Flake8

" autorun Flake8 on saving .py file
autocmd BufWritePost *.py call Flake8()

" ========================================================= Fzf

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" layout
let g:fzf_layout = { 'down': '~40%' }

" default extra key binding
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" match fzf colors to current colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <C-t> :FZF<Enter>

" ========================================================= Nerdtree

" activate nerdtree
autocmd StdinReadPre * let s:std_in=1

" autoopen nerdtree in plain file
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>

" close *vi* if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========================================================= Multicursor

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:multi_cursor_start_key='<F6>'

" ========================================================= Airline

" set theme for statusbar
let g:airline_theme = 'one'

" automatically display all buffers
let g:airline#extensions#tabline#enabled = 1

" use powerline fonts
let g:airline_powerline_fonts = 1

" ========================================================= Colors

" set color mode
set t_Co=256

" settings related to onedark theme
let g:onedark_termcolors = 1
let g:onedark_terminal_italics = 1

" settings related to deep-space theme
let g:deepspace_italics = 1

" enable true color support for nvim
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" enable syntax processing
syntax enable

" let g:solarized_termtrans = 1

syntax on
" set theme variant {dark, light}
set background=dark
" set *vi* theme
colorscheme one

" format rust code every time buffer is written
let g:rustfmt_autosave = 1

" ========================================================= Spaces and tabs

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" shifting value (<< & >>)
set shiftwidth=4

" tabs = spaces
set expandtab

" set start level for indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#232A36   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#323C4D   ctermbg=4

" ========================================================= UI Config

" show status bar
set laststatus=2

" show line numbers
set number

" show last command in bottom bar (not working with powerline)
set showcmd

" highlight currentline
set cursorline

" highlight cursor column
set cursorcolumn

" load filetype-specific indent files
filetype indent on

" smart autoindent on new line
set smartindent

" copy structure of existing indent
set copyindent

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
set showmatch

" show white characters
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" ========================================================= Searching

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" ignore case in patterns
set ignorecase

" ignorecase on locase
set smartcase

" ========================================================= Folding

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" nested fold maximum
set foldnestmax=10

" fold based on indent level
set foldmethod=indent

" ========================================================= Maps

" dissable arrows :evil:
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" remap window movement shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" shortcuts for tab management
nnoremap tt :tabedit<Space>
nnoremap tm :tabm<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" use ';' as command mode entrypoint
nnoremap ; :

" ========================================================= Annoying stuff

" disable backup files
set nobackup

" disable swap files
set noswapfile

" disable error bells
set noerrorbells

" call confirm dialog before saving, etc..
set confirm

" ========================================================= Other stuff

" fix sleepy <ESC>
set ttimeout
set ttimeoutlen=0

" autoremove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" ========================================================= Custom indent

au FileType javascript setl sw=2 sts=2 ts=2 et
au FileType html setl sw=2 sts=2 ts=2 et
au FileType css setl sw=2 sts=2 ts=2 et
