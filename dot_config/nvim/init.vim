" ------------------------------------- initial config
if &compatible
  set nocompatible
endif

" required for plugin initialization
filetype off

" set text encoding
set encoding=utf-8

" ------------------------------------- configure dein and third-party plugins

" Add the dein installation directory
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " vimscript testing
  call dein#add('junegunn/vader.vim')

  " make vim8 compatible!
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " unite all interfaces
  call dein#add('Shougo/denite.nvim')

  " completion framework
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

  " tree explorer
  call dein#add('scrooloose/nerdtree')

  " commentary management
  call dein#add('tpope/vim-commentary')

  " git plugins
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " fancy statusbar
  call dein#add('vim-airline/vim-airline.git')
  call dein#add('vim-airline/vim-airline-themes')

  " motion plugin
  call dein#add('justinmk/vim-sneak')

  " asynchronous linting and make framework
  call dein#add('neomake/neomake')

  " snippets
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " languages support
  call dein#add('sheerun/vim-polyglot')
  call dein#add('fatih/vim-go')
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('hashivim/vim-terraform')
  call dein#add('Quramy/tsuquyomi')
  call dein#add('leafgarland/typescript-vim')

  " color schemes
  call dein#add('morhetz/gruvbox')
  call dein#add('KeitaNakamura/neodark.vim')
  call dein#add('kristijanhusak/vim-hybrid-material')
  call dein#add('joshdick/onedark.vim')
  call dein#add('NLKNguyen/papercolor-theme')

  " ui tweaks
  call dein#add('Yggdroot/indentLine')

  " track your time
  call dein#add('wakatime/vim-wakatime')

  call dein#end()
  call dein#save_state()
endif

" ------------------------------------- vim behavior

" set line numbering relative to cursor location
set relativenumber

" highlight current line
set cursorline

" change cusor type to horizontal line
set guicursor+=n:hor20-Cursor/lCursor

" disable backup files
set nobackup

" disable swap files
set noswapfile

" disable error bells
set noerrorbells

" confirm dialog before saving
set confirm

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" shifting value (<< & >>)
set shiftwidth=4

" tabs = spaces
set expandtab

" show white characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" ------------------------------------- autocompletion settings

let g:deoplete#enable_at_startup = 1

" ------------------------------------- nerdtree

noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" bind nerdtree to ctrl+n
map <C-n> :NERDTreeToggle<CR>

" close *vi* if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------- snippets

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ------------------------------------- golang

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1

" ------------------------------------- indent lines

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" ------------------------------------- colors+theme

set t_Co=256
" enable true color support for neovim
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

filetype plugin indent on
syntax enable

set background=dark

" theme confuguration for neodark
let g:neodark#terminal_transparent = 1
let g:neodark#background = '#0F111A'

" hybrid material theme configuration
let g:enable_bold_font = 1
let g:enable_italic_font = 1

colorscheme gruvbox

" ------------------------------------- buffers

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>

" ------------------------------------- airline

" set theme for statusbar
" let g:airline_theme = 'hybrid'

" automatically display all buffers
let g:airline#extensions#tabline#enabled = 1

" use powerline fonts
let g:airline_powerline_fonts = 1

" ------------------------------------- python hosts

let g:python3_host_prog = '/usr/bin/python'
