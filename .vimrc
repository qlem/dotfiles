" enable ALE completion
let g:ale_completion_enabled=1

" load plugins
call plug#begin('~/.vim/plugged')
Plug 'doums/darcula'
Plug 'doums/gitBranch'
Plug 'dense-analysis/ale'
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
" set specific indent width to specific filetypes
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
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
let g:ale_hover_to_preview=1
let g:airline#extensions#ale#enabled=0
" let g:ale_sign_column_always=1
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'
let g:ale_sign_info='~~'
let g:ale_echo_msg_error_str='Err'
let g:ale_echo_msg_warning_str='Warn'
let g:ale_echo_msg_info_str='Info'
let g:ale_echo_msg_log_str='Log'
let g:ale_echo_msg_format='[%linter%][%severity%] %code: %%s'
let g:ale_lsp_show_message_format='[%linter%][%severity%] %%s'
let g:ale_lsp_show_message_severity='information'
let g:ale_warn_about_trailing_blank_lines=0
let g:ale_warn_about_trailing_whitespace=0
let g:ale_linters = {
  \ 'c': ['clangd', 'clangtidy',],
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'c': ['clangtidy'],
  \ 'javascript': ['eslint']
  \ }
let g:ale_c_clangd_options='--clang-tidy --clang-tidy-checks='
  \ . '-*,'
  \ . 'clang-diagnostic-*,'
  \ . 'clang-analyzer-*,'
  \ . '-clang-analyser-cplusplus*,'
  \ . '-clang-analyser-optin*,'
  \ . '-clang-analyser-osx*,'
  \ . 'bugprone-*,'
  \ . 'readability-*,'
  \ . 'cert-*-c'
let g:ale_c_clangtidy_checks=[
  \ '-*',
  \ 'clang-diagnostic-*',
  \ 'clang-analyzer-*',
  \ '-clang-analyser-cplusplus*',
  \ '-clang-analyser-optin*',
  \ '-clang-analyser-osx*',
  \ 'bugprone-*',
  \ 'readability-*',
  \ 'cert-*-c"'
  \ ]
let g:ale_completion_symbols = {
  \ 'text': '[txt]',
  \ 'method': '[mth]',
  \ 'function': '[fct]',
  \ 'constructor': '[ctr]',
  \ 'field': '[fld]',
  \ 'variable': '[var]',
  \ 'class': '[cls]',
  \ 'interface': '[itf]',
  \ 'module': '[mdl]',
  \ 'property': '[ppt]',
  \ 'unit': '[unt]',
  \ 'value': '[val]',
  \ 'enum': '[enm]',
  \ 'keyword': '[kwd]',
  \ 'snippet': '[spt]',
  \ 'color': '[clr]',
  \ 'file': '[fl]',
  \ 'reference': '[ref]',
  \ 'folder': '[fol]',
  \ 'enum member': '[emm]',
  \ 'constant': '[cst]',
  \ 'struct': '[stc]',
  \ 'event': '[evt]',
  \ 'operator': '[opt]',
  \ 'type_parameter': '[tpm]',
  \ '<default>': '[dfl]'
  \ }

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'darculaOriginal',
  \ 'component_function': {
  \   'gitbranch': 'gitBranch#get'
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
nnoremap <leader>h :noh<cr>
nnoremap <leader>e :lex .<cr>

" trailing space mappings
nnoremap <leader>bs /\s\+$<cr>
nnoremap <leader>bc :%s/\s\+$//g<cr>

" open / close location list window
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>lc :lclose<cr>

" window mappings
nnoremap <leader>ws :new<cr>
nnoremap <leader>wv :vnew<cr>
nnoremap <leader>w<up> :resize +4<cr>
nnoremap <leader>w<down> :resize -4<cr>
nnoremap <leader>w<right> :vertical :resize +4<cr>
nnoremap <leader>w<left> :vertical :resize -4<cr>

" tab page mappings
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>tn :tabn<cr>
nnoremap <leader>tp :tabp<cr>
nnoremap <leader>t<left> :tabm -<cr>
nnoremap <leader>t<right> :tabm +<cr>

" ale mappings
nmap <leader>a <plug>(ale_toggle_buffer)
nmap <leader>a <plug>(ale_toggle)
nmap <leader>ar <plug>(ale_find_references)
nmap <leader>ad <plug>(ale_go_to_definition)
nmap <leader>at <plug>(ale_go_to_type_definition)
nmap <leader>ap <plug>(ale_previous_wrap)
nmap <leader>an <plug>(ale_next_wrap)
nmap <leader>ai <plug>(ale_hover)
nmap <leader>am <plug>(ale_detail)
nmap <leader>af <plug>(ale_fix)
" imap <plug>(ale_complete)

" gitgutter mappings
nnoremap <leader>g :gitgutterbuffertoggle<cr>
nnoremap <leader>g :gitguttertoggle<cr>
nmap <leader>gi <plug>(gitgutterpreviewhunk)
nmap <leader>gs <plug>(gitgutterstagehunk)
nmap <leader>gu <plug>(gitgutterundohunk)
nmap <leader>gp <plug>(gitgutterprevhunk)
nmap <Leader>gn <Plug>(GitGutterNextHunk)
