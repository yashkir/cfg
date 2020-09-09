" VimRC
" Yuriy Yashkir (yuriy.yashkir@gmail.com)
set background=dark
let g:python3_host_prog = '/usr/bin/python3'

"{{{--- Plugins --- 
" Set up plug.vim if not installed
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-marketplace'
" - Special files -
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dbeniamine/todo.txt-vim'
" - Appearance/syntax -
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'Konfekt/FastFold'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
" - Currently Unused -
Plug 'owickstrom/vim-colors-paramount'
"Plug 'axvr/photon.vim'
Plug 'yashkir/photon.vim'
Plug 'adelarsq/vim-matchit'
Plug 'preservim/nerdcommenter'
"Plug 'tmhedberg/SimpylFold'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'cohama/lexima.vim'
call plug#end()
"}}}
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
set wildmenu
set wildmode=list:longest,full
set updatetime=500
set signcolumn=yes

let $BASH_ENV="~/.vim_bash_env"

""" FOLDING
set foldmethod=syntax
set foldlevelstart=99

let javaScript_fold=1

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
"}}}
"{{{--- BINDS ---
let mapleader = ","
let maplocalleader = "\\"
map <F8> :w<CR>:!gcc % -o %< && ./%<<CR>
map <F9> :e $HOME/.vimrc<CR>
map <F6> :so $HOME/.vimrc<CR>

map <Space> za
map <S-Enter> O<Esc>
map <CR> o<Esc>

map <leader>m :w<CR>:!make test<CR>
map <leader>w :w<CR>
map <leader>r :w<CR>:!%:p<CR>
map <leader>h :set hlsearch!<CR>
map <leader>md :InstantMarkdownPreview<CR>

" --- Plugins
map <leader>g :GitGutterToggle<CR>
map <leader>p :Files ~/projects/<CR>
map <leader>f~ :Files ~<CR>
map <leader>f. :Files .<CR>
map <leader>fh :History<CR>
map <leader>G :Git<CR>
map <leader>fh :History<CR>
nnoremap <C-p> :GFiles<CR>

"}}}}}}
"{{{--- AutoCMD ---
""TODO move this stuff out to appropriate directories
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal textwidth=113
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
autocmd FileType markdown setlocal tabstop=4
autocmd FileType markdown setlocal textwidth=78
autocmd FileType markdown let b:coc_suggest_disable = 1
"autocmd FileType help wincmd L
"}}}
"{{{--- APPEARANCE ---
" fix termguicolors under tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.whitespace = ''

let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'SignColumn': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'Pmenu': { '256ctermfg': '255', '256ctermbg': 235 },
\}
"colorscheme jellybeans

colorscheme photon
hi link pythonClassVar Special

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
"{{{--- Other PLUGINS ---

"--- VIMWIKI ---
set conceallevel=2
"let g:vimwiki_folding = 'list'
let g:vimwiki_list = [{'path': '~/projects/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_global_ext = 0
"nmap <leader>wp :cd %:p:h<cr>:!git commit -a -m "vim autocommit"; git push<cr>
nmap <leader>wp :!bash /home/yashkir/projects/wiki/autocommit.sh<CR>

"This allows us to check the syntax group under the cursor
nmap <leader>q :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

let g:instant_markdown_autostart = 0

" FASTFOLD
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

"}}}
"{{{--- COC ---
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"}}}

" vim: set foldmethod=marker
