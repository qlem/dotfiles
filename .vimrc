" load plugins
call plug#begin('~/.vim/plugged')
Plug 'doums/coBra'
Plug 'doums/darcula'
Plug 'doums/gitBranch'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
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
set hidden
set fillchars=vert:│
set previewheight=5

" color settings
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

" completion menu settings
set completeopt=menuone,popup,noinsert,noselect
set completepopup=height:5,width:40,highlight:Pmenu,border:off
set pumwidth=15
set pumheight=10

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
" use specific indent width for specific filetypes
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" enable max text width column in C files
autocmd FileType c setlocal textwidth=80 colorcolumn=+1
" use C/C++ syntax highlighting in the YCM doc. popup
autocmd FileType c,cpp let b:ycm_hover = {
  \ 'command': 'GetDoc',
  \ 'syntax': &filetype
  \ }
augroup END

" max text width column highlighting
hi! ColorColumn ctermbg=236 guibg=NONE

" netrw settings
let g:netrw_banner=0
let g:netrw_winsize=30

" NERDCommenter settings
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" GitGutter settings
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_sign_removed = '▶'
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe

" YouCompleteMe settings
let g:ycm_auto_hover=''
let g:ycm_max_num_candidates = 50
let g:ycm_max_num_identifier_candidates=20
let g:ycm_max_diagnostics_to_display=50
let g:ycm_disable_for_files_larger_than_kb=1000
let g:ycm_warning_symbol='--'
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_stop_completion=['<CR>']
let g:ycm_key_detailed_diagnostics=''
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:ycm_clangd_uses_ycmd_caching=1
let g:ycm_clangd_args = ['--clang-tidy', '--clang-tidy-checks='
  \ . '-*,'
  \ . 'clang-diagnostic-*,'
  \ . 'clang-analyzer-*,'
  \ . '-clang-analyser-cplusplus*,'
  \ . '-clang-analyser-optin*,'
  \ . '-clang-analyser-osx*,'
  \ . 'bugprone-*,'
  \ . 'readability-*,'
  \ . '-readability-magic-numbers,'
  \ . 'cert-*-c'
  \ ]
hi! link YcmErrorSection Error
hi! link YcmWarningSection CodeWarning
hi! link YcmErrorSign ErrorSign
hi! link YcmWarningSign WarningSign

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'darculaOriginal',
  \ 'component_function': {
  \   'gitBranch': 'gitBranch#Get'
  \ }
  \ }
let g:lightline.active = {
  \ 'right': [
  \   ['lineinfo'],
  \   ['percent'],
  \   ['gitBranch','fileformat', 'fileencoding', 'filetype']
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

" global key bindings
let mapleader=","
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>e :lex .<CR>

" trailing space key bindings
nnoremap <Leader>bs /\s\+$<CR>
nnoremap <Leader>bc :%s/\s\+$//g<CR>

" open / close location list window
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

" window key bindings
nnoremap <Leader>ws :new<CR>
nnoremap <Leader>wv :vnew<CR>
nnoremap <Leader>w<up> :resize +4<CR>
nnoremap <Leader>w<down> :resize -4<CR>
nnoremap <Leader>w<right> :vertical resize +4<CR>
nnoremap <Leader>w<left> :vertical resize -4<CR>

" tab page key bindings
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>t<left> :tabm -<CR>
nnoremap <Leader>t<right> :tabm +<CR>

" GitGutter key bindings
nnoremap <Leader>ge :GitGutterBufferToggle<cr>
nnoremap <Leader>gE :GitGutterToggle<cr>
nmap <Leader>gi <Plug>(GitGutterPreviewHunk)
nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gn <Plug>(GitGutterNextHunk)

" YouCompleteMe key bindings
nnoremap <Leader>aF :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>al :YcmDiags<CR>
nnoremap <Leader>am :YcmShowDetailedDiagnostic<CR>
nnoremap <Leader>ag :YcmCompleter GoTo<CR>
nnoremap <Leader>ah :YcmCompleter GoToInclude<CR>
nnoremap <Leader>ad :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>aD :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ar :YcmCompleter GoToReferences<CR>
nnoremap <Leader>at :YcmCompleter GetType<CR>
nnoremap <Leader>ap :YcmCompleter GetParent<CR>
nnoremap <Leader>ai :YcmCompleter GetDoc<CR>
nnoremap <Leader>af :YcmCompleter FixIt<CR>
nnoremap <Leader>an :YcmCompleter RefactorRename 
nmap <Leader>d <Plug>(YCMHover)
