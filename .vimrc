" VimRC
" Yuriy Yashkir (yuriy.yashkir@gmail.com)
set background=dark

"{{{--- Plugins --- 

" Begin plug.vim ---------------------------------------------------------------
" Set up Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" - Coding -
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
" - Special files -
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dbeniamine/todo.txt-vim'
"Plug 'godlygeek/tabular' " markdown dependency
"Plug 'plasticboy/vim-markdown'
" - Appearance/syntax -
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
" - Unused -
Plug 'chazy/dirsettings'
"Plug 'aditya-azad/candle-grey'
"Plug 'altercation/vim-colors-solarized'
"Plug 'https://github.com/sjl/badwolf/'
"Plug 'gruvbox-community/gruvbox'
"Plug 'morhetz/gruvbox'
"Plug 'powerline/powerline'
"Plug 'pangloss/vim-javascript'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Yggdroot/indentLine'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fannheyward/coc-marketplace'
"Plug 'bluz71/vim-moonfly-colors'
"Plug 'cohama/lexima.vim'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
" End Plugins ------------------------------------------------------------------

"}}}--- PLUGIN SPECIFIC ---
"{{{--- BASIC SETs ---
set nocompatible
set tabstop=2
set shiftwidth=0
set expandtab
set smarttab
set smartindent
set laststatus=2
set showcmd
set showmode
set number
set relativenumber
set incsearch
set wildmode=list:longest,list:full

""" FOLDING
set foldmethod=syntax
set foldlevelstart=99

let javaScript_fold=1

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
"}}}
"{{{--- BINDS ---
map <F9> :e $HOME/.vimrc<CR>
map <F6> :so $HOME/.vimrc<CR>
map <Space> za
let mapleader = ","
let maplocalleader = "\\"
map <Leader>m :w<CR>:!make test<CR>
"map <Leader>t :tabnext<CR>
map <Leader>tl :!td ls<CR>
map <Leader>T :vsplit /home/yashkir/.todo/todo.txt<CR>
map <Leader>w :w<CR>
map <Leader>i :IndentLinesToggle<CR>
map <Leader>r :w<CR>:!%:p<CR>
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>h :set hlsearch!<CR>
map <leader>o :browse old<CR>
map <leader>g :GitGutterToggle<CR>
" --- FZF
map <leader>p :Files ~/projects/<CR>
map <leader>f~ :Files ~<CR>
map <leader>f. :Files .<CR>
map <leader>fh :History<CR>
map <leader>G :Git<CR>
map <leader>fh :History<CR>
map <leader>md :InstantMarkdownPreview<CR>
nnoremap <C-p> :GFiles<CR>

map <S-Enter> O<Esc>
map <CR> o<Esc>

"}}}}}}
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
autocmd FileType vim setlocal foldlevel=0
autocmd FileType htmldjango let b:surround_37 = "{% \r %}"
autocmd FileType htmldjango let b:surround_45 = "{{ \r }}"
autocmd FileType vimwiki setlocal nowrap
autocmd FileType vimwiki setlocal shiftwidth=4
autocmd FileType vimwiki setlocal tabstop=4

"autocmd FileType help wincmd L
"}}}
"{{{--- APPEARANCE ---
" fix termguicolors under tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors

set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:jellybeans_use_term_italics = 1
"let g:gruvbox_colors = { 'bg0': 0 }
"colorscheme gruvbox
"colorscheme yashkir

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_powerline_fonts = 1
"let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty=''
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.whitespace = ''
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'SignColumn': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
"\    'Function': { '256ctermfg': '221' },
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

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
"{{{--- Other ---
let g:ycm_autoclose_preview_window_after_completion=1
let $BASH_ENV="~/.vim_bash_env"

"--- VIMWIKI ---
set conceallevel=2
"let g:vimwiki_folding = 'list'
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_global_ext = 0
"nmap <leader>wp :cd %:p:h<cr>:!git commit -a -m "vim autocommit"; git push<cr>
nmap <leader>wp :!bash /home/yashkir/Sync/wiki/autocommit.sh<CR>

nmap <leader>q :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

let g:instant_markdown_autostart = 0
"GIT GUTTER
set updatetime=100
"let g:gitgutter_sign_column_always=1
"let g:gitgutter_enabled=0
set signcolumn=yes

"}}}

" vim: set foldmethod=marker
