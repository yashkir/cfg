if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

call plug#end()

nnoremap <C-p> :GFiles<CR>

set tabstop=2
set shiftwidth=0
set expandtab
set smarttab
set smartindent

set listchars=tab:▸\ ,eol:¬

set nocompatible
set ruler
set laststatus=2
set showcmd
set showmode
set relativenumber
"set number
"set cursorline

"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

set incsearch

set foldmethod=syntax
set foldlevelstart=99
let javaScript_fold=1

map <F9> :e $HOME/.vimrc<CR>
map <F6> :so $HOME/.vimrc<CR>


let mapleader = ","
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :w<CR>:!make test<CR>
map <Leader>t :tabnext<CR>
map <Leader>T :tabnext<CR>
map <Leader>w :w<CR>

map <S-Enter> O<Esc>
map <CR> o<Esc>

""TODO move this stuff out to appropriate directories
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal tabstop=2
autocmd FileType c setlocal tabstop=4
autocmd FileType css setlocal tabstop=2
autocmd FileType php setlocal tabstop=2

" APPEARANCE
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
""colorscheme distinguished
"hi LineNr ctermfg=blue
"hi Type ctermfg=darkgreen
"hi MatchParen cterm=none ctermbg=darkblue ctermfg=none
"hi Folded ctermbg=17
"hi Statement ctermfg=8
