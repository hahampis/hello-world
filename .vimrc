" get out of horrible vi-compatible mode
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" For full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


set encoding=utf-8

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Invoke ctrlp with opentas_ft as starting directory
let g:ctrlp_cmd = 'CtrlP ~/opentas_ft'

" Search in regexp (not fuzzy) mode by default (can be toggled with <c-r>)
let g:ctrlp_regexp = 1

let python_highlight_all=1

"set wrapmargin=120
set laststatus=2


" 256 color mode
set t_Co=256

" Zenburn colorscheme
"colorscheme zenburn

" Molokai colorscheme settings
"let g:rehash256 = 1
"let g:molokai_original = 1
colorscheme molokai

" Solarized colorscheme. Remember to set solarized colorscheme in Konsole too
" colorscheme solarized


syntax on
set wildmode=longest,list

"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead,BufNewFile *.robot set filetype=robot

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#,-


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command-line completion operates in an enhanced mode
set wildmenu

" Show the line and column number of the cursor position
set ruler

" Print the line number in front of each line
set number

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" use mouse everywhere
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show matching brackets for a moment
set showmatch

" how many tenths of a second to blink matching brackets for
set matchtime=5

" do not highlight searched phrases
set nohlsearch

" but do highlight as you type you search phrase
set incsearch

" When nonempty, this option determines the content of the status line
set statusline=%{fugitive#statusline()}\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" always show the status line
set laststatus=2

" Show the cursor
set cursorline
set cursorcolumn

set ignorecase

" Custom bindings
"nnoremap <silent> <F8> :TlistOpen<CR>
nnoremap <silent> <F9> :Gblame<CR>
nnoremap gp :tabp<CR>
execute pathogen#infect()
