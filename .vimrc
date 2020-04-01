" plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'doums/darcula'
Plug 'doums/gitBranch'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
call plug#end()

" global settings
set nocompatible
set number
set cursorline
set laststatus=2
set ruler
set showcmd
set noshowmode
set shortmess=a
set ttimeout
set ttimeoutlen=100
set updatetime=100
set splitbelow
set splitright
set wildmenu
set display=lastline
set backspace=indent,eol,start
set cindent

" colors settings
set termguicolors
set background=dark
colorscheme darcula

" bracket settings
set showmatch
set matchtime=3

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

" enable filetype detection / plugin / indent
filetype plugin indent on
" enable syntax highlighting
syntax on

" open man pages into vim
runtime ftplugin/man.vim

" some auto commands
augroup vimrc
autocmd!
" remove line numbers in man pages
autocmd FileType man set nonumber
augroup END

" GitGutter settings
let g:gitgutter_map_keys=0

" netrw settings
let g:netrw_banner=0
let g:netrw_winsize=30

" NERDCommenter settings
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" ALE settings
let g:ale_linters_explicit=1
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_format='[%linter%][%severity%] %code: %%s'
let g:ale_linters = {
    \ 'javascript': ['eslint']
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint']
    \ }

" lightline settings
let g:lightline = {
    \ 'colorscheme': 'darculaOriginal',
    \ 'component_function': {
    \   'gitbranch': 'gitBranch#Get'
    \ }
    \ }
let g:lightline.active = {
    \ 'right': [
    \   ['lineinfo'],
    \   ['percent'],
    \   ['gitbranch','fileformat', 'fileencoding', 'filetype']
    \ ]
    \ }
let g:lightline.tabline = {
    \ 'left': [ ['tabs'] ],
    \ 'right': []
    \ }
let g:lightline.tab = {
    \ 'active': ['filename', 'modified'],
    \ 'inactive': ['filename', 'modified']
    \ }

" global mappings
let mapleader=","
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>e :Lex .<CR>

" trailing space mappings
nnoremap <Leader>bs /\s\+$<CR>
nnoremap <Leader>bc :%s/\s\+$//g<CR>

" windows mappings
nnoremap <Leader>ws :new<CR>
nnoremap <Leader>wv :vnew<CR>
nnoremap <Leader>w<Up> :resize +4<CR>
nnoremap <Leader>w<Down> :resize -4<CR>
nnoremap <Leader>w<Right> :vertical :resize +4<CR>
nnoremap <Leader>w<Left> :vertical :resize -4<CR>

" tab pages mappings
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>t<Left> :tabm -<CR>
nnoremap <Leader>t<Right> :tabm +<CR>

" ALE mappings
nmap <Leader>a <Plug>(ale_toggle_buffer)
nmap <Leader>A <Plug>(ale_toggle)
nmap <Leader>ar <Plug>(ale_find_references)
nmap <Leader>ad <Plug>(ale_go_to_definition)
nmap <Leader>at <Plug>(ale_go_to_type_definition)
nmap <Leader>ap <Plug>(ale_previous_wrap)
nmap <Leader>an <Plug>(ale_next_wrap)
nmap <Leader>ai <Plug>(ale_hover)
nmap <Leader>am <Plug>(ale_detail)
nmap <Leader>af <Plug>(ale_fix)
" imap <Plug>(ale_complete)

" GitGutter mappings
nnoremap <Leader>g :GitGutterBufferToggle<CR>
nnoremap <Leader>G :GitGutterToggle<CR>
nmap <Leader>gi <Plug>(GitGutterPreviewHunk)
nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gn <Plug>(GitGutterNextHunk)
