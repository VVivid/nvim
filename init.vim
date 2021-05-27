syntax on
set noswapfile
set number
set hlsearch
set ignorecase
set tabstop=4
set incsearch
set shell=/bin/zsh
let $SHELL = "/bin/zsh"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'gorodinskiy/vim-coloresque'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

"Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
set encoding=UTF-8
set bg=dark

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
source $HOME/.config/nvim/coc.vim


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


let g:javascript_plugin_jsdoc = 1

"let g:airline_theme='angr'

" Toggle spelling visual
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = -1
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

inoremap jk <ESC>
let mapleader = "'"

" NerdTreeToggle
nnoremap <silent> <leader>nf :NERDTreeToggle<CR>
nnoremap <silent> <leader>ff :GFiles<CR>
" call neomake#configure#automake('nrwi', 502)
let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'C0103, C0111, E0402,',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }

let g:neomake_python_enabled_makers = ['flake9', 'pylint']
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>

