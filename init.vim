syntax on
set number
set noswapfile
set hlsearch
set ignorecase
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
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
" Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
" Plug 'othree/html5.vim'
" Plug 'mattn/emmet-vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
source $HOME/.config/nvim/coc.vim

let g:javascript_plugin_jsdoc = 1

let g:airline_theme='angr'

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
call neomake#configure#automake('nrwi', 502)
let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'C0103, C0111',
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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>

