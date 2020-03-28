" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'doums/darcula'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()

" some defaults
set termguicolors
set number
set cursorline 
set showcmd
set shortmess=a
set wildmenu
set ttimeout
set ttimeoutlen=100

" tab config
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" search config
set ignorecase
set smartcase
set hlsearch
set incsearch

" bracket config
set showmatch
set matchtime=3

" allows window splitting below and right
set splitbelow
set splitright

" enables syntax highlighting
filetype plugin on
syntax on

" open man pages into vim
runtime ftplugin/man.vim

" remove line numbers from man pages
augroup stuff
autocmd!
autocmd FileType man set nonumber
augroup END

" colorscheme config
colorscheme darcula
set background=dark

" lightline config
set noshowmode
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'darculaOriginal',
    \ }

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
" let g:NERDDefaultAlign='left'
" let g:NERDToggleCheckAllLines=1

" ALE
let g:ale_linters_explicit=1
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_format='[%linter%][%severity%] %code: %%s'
let g:ale_linters = {
    \ 'javascript': ['eslint', 'standard'],
    \ 'typescript': ['eslint', 'tslint']
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint', 'standard'],
    \ 'typescript': ['eslint', 'tslint']
    \ }
" let g:ale_sign_column_always=1

" Git Gutter config
set updatetime=100
let g:gitgutter_map_keys=0

" general mapping
let mapleader = ","
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>e :edit .<CR>

" windows mapping
nnoremap <Leader>ws :new<CR>
nnoremap <Leader>wv :vnew<CR>
nnoremap <Leader>w<Up> :resize +4<CR>
nnoremap <Leader>w<Down> :resize -4<CR>
nnoremap <Leader>w<Right> :vertical :resize +4<CR>
nnoremap <Leader>w<Left> :vertical :resize -4<CR>

" tabs mapping
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>t<Left> :tabm -<CR>
nnoremap <Leader>t<Right> :tabm +<CR>

" ALE mapping
nmap <Leader>l <Plug>(ale_toggle)
nmap <Leader>L <Plug>(ale_toggle_buffer)
nmap <Leader>r <Plug>(ale_find_references)
nmap <Leader>d <Plug>(ale_go_to_definition_in_split)
nmap <Leader>j <Plug>(ale_previous_wrap)
nmap <Leader>k <Plug>(ale_next_wrap)
nmap <Leader>i <Plug>(ale_hover)
nmap <Leader>m <Plug>(ale_detail)
imap <Leader><C-Space> <Plug>(ale_complete)
" nmap <Plug>(ale_fix)
" nmap <Plug>(ale_documentation)
" nmap <Plug>(ale_go_to_type_definition_in_split)

" Git Gutter mapping
nnoremap <Leader>g :GitGutterBufferToggle<CR>
nnoremap <Leader>G :GitGutterToggle<CR>
nmap <Leader>gp <Plug>GitGutterPreviewHunk     
nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gj <Plug>GitGutterPrevHunk
nmap <Leader>gk <Plug>GitGutterNextHunk
omap <Leader>gi <Plug>GitGutterTextObjectInnerPending
omap <Leader>go <Plug>GitGutterTextObjectOuterPending
xmap <Leader>gi <Plug>GitGutterTextObjectInnerVisual
xmap <Leader>go <Plug>GitGutterTextObjectOuterVisual
