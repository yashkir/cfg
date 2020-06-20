" VimRC
" Yuriy Yashkir (yuriy.yashkir@gmail.com)

"{{{--- Plugins --- 
" Set up Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Begin Plugins ----------------------------------------------------------------
"Plug 'https://github.com/sjl/badwolf/'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"Plug 'powerline/powerline'
Plug 'tpope/vim-fugitive'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'dbeniamine/todo.txt-vim'
Plug 'Yggdroot/indentLine'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fannheyward/coc-marketplace'
Plug 'ycm-core/YouCompleteMe'
"Plug 'nathanaelkane/vim-indent-guides'
" End Plugins ------------------------------------------------------------------
call plug#end()
"}}}

"{{{--- BASIC SETs ---
set nocompatible
set tabstop=2
set shiftwidth=0
set expandtab
set smarttab
set smartindent
set ruler
set laststatus=2
set showcmd
set showmode
set relativenumber
set number
set incsearch
set hlsearch
"set cursorline
set wildmode=list
set wildmode=list,full

""" FOLDING
set foldmethod=syntax
set foldlevelstart=99
let javaScript_fold=1
"}}}

"{{{--- BINDS ---
map <F9> :e $HOME/.vimrc<CR>
map <F6> :so $HOME/.vimrc<CR>
map <Space> zA
let mapleader = ","
let maplocalleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :w<CR>:!make test<CR>
"map <Leader>t :tabnext<CR>
map <Leader>tl :!td ls<CR>
map <Leader>T :tabnext<CR>
map <Leader>w :w<CR>
map <Leader>i :IndentLinesToggle<CR>
map <Leader>r :!%:p<CR>
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>f :Files<CR>
map <leader>h :nohlsearch<CR>
map <leader>p :Files ~/projects/<CR>
let g:ycm_autoclose_preview_window_after_completion=1

nnoremap <C-p> :GFiles<CR>

map <S-Enter> O<Esc>
map <CR> o<Esc>
"}}}

"{{{--- AutoCMD ---
""TODO move this stuff out to appropriate directories
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal tabstop=2
autocmd FileType c setlocal tabstop=4
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal foldmethod=indent
autocmd FileType css setlocal tabstop=2
autocmd FileType php setlocal tabstop=2
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0"
"}}}

"{{{--- APPEARANCE ---

set background=dark
"let g:jellybeans_use_term_italics = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = 'm'
let g:airline_symbols.dirty=''
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
"if has('termguicolors') && &termguicolors
"  let g:jellybeans_overrides['background']['guibg'] = 'none'
"endif
colorscheme jellybeans

set foldtext=MyFoldText()
set fillchars=vert:\|,fold:.
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = winwidth(0) - strdisplaywidth(line_text) - 15
    return line_text . repeat('.', fillcharcount) . ' ' . folded_line_num . ' L '
endfunction
"}}}

"{{{--- Other ---
let $BASH_ENV="~/.vim_bash_env"
"}}}
