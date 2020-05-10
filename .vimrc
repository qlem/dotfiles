" enable ALE completion
let g:ale_completion_enabled=0

" load plugins
call plug#begin('~/.vim/plugged')
Plug 'doums/darcula'
Plug 'doums/gitBranch'
Plug 'dense-analysis/ale'
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

" override highlight of the max text width column
hi clear ColorColumn
hi ColorColumn ctermfg=11 ctermbg=236

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
" set indent width for specific filetypes
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" enable max text width column in c files
autocmd FileType c setlocal textwidth=80 colorcolumn=+1
" use C/C++ syntax highlighting in the YCM doc. popup
autocmd FileType c,cpp let b:ycm_hover = {
  \ 'command': 'GetDoc',
  \ 'syntax': &filetype
  \ }
augroup END

" GitGutter settings
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0

" netrw settings
let g:netrw_banner=0
let g:netrw_winsize=30

" NERDCommenter settings
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" YouCompleteMe settings
let g:ycm_auto_hover=''
let g:ycm_max_diagnostics_to_display=50
let g:ycm_disable_for_files_larger_than_kb=1000
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_stop_completion=['<cr>']
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

" ALE settings
let g:ale_enabled=0
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
  \ . '-readability-magic-numbers,'
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
  \ '-readability-magic-numbers',
  \ 'cert-*-c"'
  \ ]
let g:ale_completion_symbols = {
  \ 'text': '[TXT]',
  \ 'method': '[MTH]',
  \ 'function': '[FCT]',
  \ 'constructor': '[CTR]',
  \ 'field': '[FLD]',
  \ 'variable': '[VAR]',
  \ 'class': '[CLS]',
  \ 'interface': '[ITF]',
  \ 'module': '[MDL]',
  \ 'property': '[PPT]',
  \ 'unit': '[UNT]',
  \ 'value': '[VAL]',
  \ 'enum': '[ENM]',
  \ 'keyword': '[KWD]',
  \ 'snippet': '[SPT]',
  \ 'color': '[CLR]',
  \ 'file': '[FLE]',
  \ 'reference': '[REF]',
  \ 'folder': '[FOL]',
  \ 'enum member': '[EMM]',
  \ 'constant': '[CST]',
  \ 'struct': '[STC]',
  \ 'event': '[EVT]',
  \ 'operator': '[OPT]',
  \ 'type_parameter': '[TPM]',
  \ '<default>': '[DFL]'
  \ }

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
nnoremap <Leader>h :noh<cr>
nnoremap <Leader>e :lex .<cr>

" trailing space key bindings
nnoremap <Leader>bs /\s\+$<cr>
nnoremap <Leader>bc :%s/\s\+$//g<cr>

" open / close location list window
nnoremap <Leader>lo :lopen<cr>
nnoremap <Leader>lc :lclose<cr>

" window key bindings
nnoremap <Leader>ws :new<cr>
nnoremap <Leader>wv :vnew<cr>
nnoremap <Leader>w<up> :resize +4<cr>
nnoremap <Leader>w<down> :resize -4<cr>
nnoremap <Leader>w<right> :vertical resize +4<cr>
nnoremap <Leader>w<left> :vertical resize -4<cr>

" tab page key bindings
nnoremap <Leader>t :tabnew<cr>
nnoremap <Leader>tn :tabn<cr>
nnoremap <Leader>tp :tabp<cr>
nnoremap <Leader>t<left> :tabm -<cr>
nnoremap <Leader>t<right> :tabm +<cr>

" YouCompleteMe key bindings
nnoremap <Leader>aF :YcmForceCompileAndDiagnostics<cr>
nnoremap <Leader>al :YcmDiags<cr>
nnoremap <Leader>am :YcmShowDetailedDiagnostic<cr>
nnoremap <Leader>ag :YcmCompleter GoTo<cr>
nnoremap <Leader>ah :YcmCompleter GoToInclude<cr>
nnoremap <Leader>ad :YcmCompleter GoToDeclaration<cr>
nnoremap <Leader>aD  :YcmCompleter GoToDefinition<cr>
nnoremap <Leader>ar :YcmCompleter GoToReferences<cr>
nnoremap <Leader>at :YcmCompleter GetType<cr>
nnoremap <Leader>ap :YcmCompleter GetParent<cr>
nnoremap <Leader>ai :YcmCompleter GetDoc<cr>
nnoremap <Leader>af :YcmCompleter FixIt<cr>
nmap <Leader>d <plug>(YCMHover)

" ALE key bindings
" nmap <Leader>a <Plug>(ale_toggle_buffer)
" nmap <Leader>A <Plug>(ale_toggle)
" nmap <Leader>ar <Plug>(ale_find_references)
" nmap <Leader>ad <Plug>(ale_go_to_definition)
" nmap <Leader>at <Plug>(ale_go_to_type_definition)
" nmap <Leader>ao <Plug>(ale_documentation)
" nmap <Leader>an <plug>(ale_rename)
" nmap <Leader>ai <Plug>(ale_hover)
" nmap <Leader>am <Plug>(ale_detail)
" nmap <Leader>ak <Plug>(ale_previous_wrap)
" nmap <Leader>aj <Plug>(ale_next_wrap)
" nmap <Leader>af <Plug>(ale_fix)
" imap <Plug>(ale_complete)

" GitGutter key bindings
nnoremap <Leader>g :GitGutterBufferToggle<cr>
nnoremap <Leader>G :GitGutterToggle<cr>
nmap <Leader>gi <Plug>(GitGutterPreviewHunk)
nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gk <Plug>(GitGutterPrevHunk)
nmap <Leader>gj <Plug>(GitGutterNextHunk)
