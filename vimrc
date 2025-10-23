" ~/.vimrc
" Modern Minimal Vim Configuration

" ============================================================================
" Basic Settings
" ============================================================================
set nocompatible
filetype plugin indent on
syntax enable

" Clipboard
set clipboard=unnamed
" Explicit clipboard mappings if auto doesn't work
nnoremap y "*y
nnoremap yy "*yy
nnoremap Y "*Y
vnoremap y "*y
nnoremap p "*p
nnoremap P "*P
vnoremap p "*p
vnoremap P "*P

" Interface
set number
set relativenumber
set cursorline
set signcolumn=yes
set termguicolors
set mouse=a
set showmatch
set laststatus=2
set cmdheight=1

" Editing
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=indent,eol,start
set wrap
set linebreak

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Performance
set updatetime=300
set timeoutlen=500
set hidden
set nobackup
set nowritebackup
set noswapfile

" Splits
set splitright
set splitbelow

" Scrolling
set scrolloff=8
set sidescrolloff=8

" Completion
set completeopt=menu,menuone,noselect
set pumheight=10

" Wildmenu
set wildmenu
set wildmode=longest:full,full

" Clipboard
if has('clipboard')
    set clipboard=unnamedplus
endif

" Leader
let mapleader = " "

" ============================================================================
" Plugin Manager (vim-plug)
" ============================================================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" LSP & Completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" File Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax & Language Support
Plug 'sheerun/vim-polyglot'

" Utilities
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Color Scheme
" Plug 'morhetz/gruvbox'

call plug#end()

" ============================================================================
" Color Scheme
" ============================================================================
set background=dark
colorscheme wildcharm
"
" ============================================================================
" LSP Configuration
" ============================================================================
" Enable LSP for supported filetypes
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_highlight_enabled = 0

" LSP signs
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'text': '💡'}
let g:lsp_signs_information = {'text': 'ℹ'}

" LSP Keymaps
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [d <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]d <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ============================================================================
" Asyncomplete Configuration
" ============================================================================
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200

" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" ============================================================================
" FZF Configuration
" ============================================================================
let g:fzf_layout = { 'down': '40%' }

" FZF Keymaps
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>h :History<CR>

" ============================================================================
" Key Mappings
" ============================================================================

" Save and Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Buffer Navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window Resize
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Clear Search Highlight
nnoremap <Esc> :nohlsearch<CR>

" Better Indenting
vnoremap < <gv
vnoremap > >gv

" Move Lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" File Explorer
nnoremap <leader>e :Lexplore<CR>

" Search and Replace
nnoremap <leader>s :%s//g<Left><Left>
vnoremap <leader>s :s//g<Left><Left>

" ============================================================================
" Netrw (File Explorer) Settings
" ============================================================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" ============================================================================
" Auto Commands
" ============================================================================
augroup vimrc_autocmds
    autocmd!
    " Return to last edit position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Trim trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e

    " Auto-create directories when saving
    autocmd BufWritePre * if !isdirectory(expand('%:h')) | call mkdir(expand('%:h'), 'p') | endif
augroup END

" ============================================================================
" Status Line
" ============================================================================
set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
