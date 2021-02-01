" plugins
call plug#begin('~/.vim/plugged')
Plug 'doums/coBra'
Plug 'doums/barow'
Plug 'doums/darcula'
Plug 'doums/barowGit'
" Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'

"web development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'
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

" enable filetype detection/plugin/indent
filetype plugin indent on
" enable syntax highlighting
syntax on

" open man pages into vim
runtime ftplugin/man.vim

" some customizations
augroup MyCustoms
autocmd!
" remove line numbers in man pages
autocmd FileType man set nonumber
" override indent width for specific filetypes
autocmd FileType vim,json,yaml,typescript,typescriptreact setlocal shiftwidth=2 tabstop=2
" enable max text width column in C files
autocmd FileType c setlocal textwidth=80 colorcolumn=+1
" use C/C++/typescript syntax highlighting in YCM doc popup
autocmd FileType c,cpp,typescript let b:ycm_hover = {
  \ 'command': 'GetDoc',
  \ 'syntax': &filetype
  \ }
augroup END

" override some highlighting groups
hi! ColorColumn ctermbg=236 guibg=NONE
hi! Error term=reverse cterm=underline ctermfg=131 guifg=#BC3F3C

" expose funcs to display error summary from ALE and YCM in status line
function ErrorCount()
  let buf = bufnr('%')
  let ale = ale#statusline#Count(buf)
  let ycmerr = youcompleteme#GetErrorCount()
  let err = ycmerr + ale->get('error') + ale->get('style_error')
  if err > 0 | return err . 'e' | else | return ''
endfunction

function WarningCount()
  let buf = bufnr('%')
  let ale = ale#statusline#Count(buf)
  let ycmwarn = youcompleteme#GetWarningCount()
  let warn = ycmwarn + ale->get('warning') + ale->get('style_warning')
  if warn > 0 | return warn . 'w' | else | return ''
endfunction

function InfoCount()
  let buf = bufnr('%')
  let ale = ale#statusline#Count(buf)
  let info = ale->get('info')
  if info > 0 | return info . 'i' | else | return ''
endfunction

augroup ErrorSummary
  autocmd!
  autocmd User ALELintPost call barow#update()
  autocmd User ALEFixPost call barow#update()
augroup END

" netrw settings
let g:netrw_banner=0
let g:netrw_winsize=22
let g:netrw_liststyle=3

" typescript-vim settings
let g:typescript_indent_disable=1

" vim-jsx-pretty settings
let g:vim_jsx_pretty_disable_js=1

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

" ALE settings
let g:ale_enabled=1
let g:ale_disable_lsp=1
let g:ale_linters_explicit=1
let g:ale_set_highlights=1
let g:ale_fix_on_save=0
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'
let g:ale_sign_info='~~'
let g:ale_sign_style_error='>>'
let g:ale_sign_style_warning='--'
let g:ale_echo_cursor=1
let g:ale_echo_msg_format='[%linter%][%severity%] %s (%code%)'
let g:ale_echo_msg_error_str='Error'
let g:ale_echo_msg_warning_str='Warning'
let g:ale_echo_msg_info_str='Info'
let g:ale_linters = {
  \ 'json': [ 'eslint' ],
  \ 'javascript': [ 'eslint' ],
  \ 'typescript': [ 'eslint', 'tsserver' ],
  \ 'typescriptreact': [ 'eslint', 'tsserver' ],
  \ 'graphql': [ 'eslint '],
  \ 'sh': [ 'shellcheck' ]
  \ }
let g:ale_fixers = {
  \ 'json': [ 'eslint' ],
  \ 'javascript': [ 'prettier', 'eslint' ],
  \ 'typescript': [ 'prettier', 'eslint' ],
  \ 'typescriptreact': [ 'prettier', 'eslint' ],
  \ 'graphql': [ 'eslint' ],
  \ }
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEStyleError Error
hi! link ALEStyleWarning CodeWarning
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign
hi! link ALEStyleErrorSign ErrorSign
hi! link ALEStyleWarningSign WarningSign

" YouCompleteMe settings
let g:ycm_auto_hover=''
let g:ycm_key_detailed_diagnostics=''
let g:ycm_max_num_candidates=50
let g:ycm_max_num_identifier_candidates=20
let g:ycm_max_diagnostics_to_display=50
let g:ycm_disable_for_files_larger_than_kb=1000
let g:ycm_always_populate_location_list=0
let g:ycm_use_ultisnips_completer=0
let g:ycm_enable_diagnostic_signs=1
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='--'
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion=['<C-y>']
let g:ycm_tsserver_binary_path='$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tsserver/bin/tsserver'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_use_clangd=1
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

" barow settings
let g:barow = {
  \ 'modes': {
  \   'normal': [ ' ', 'BarowNormal' ],
  \   'insert': [ 'i', 'BarowInsert' ],
  \   'replace': [ 'r', 'BarowReplace' ],
  \   'visual': [ 'v', 'BarowVisual' ],
  \   'v-line': [ 'l', 'BarowVisual' ],
  \   'v-block': [ 'b', 'BarowVisual' ],
  \   'select': [ 's', 'BarowVisual' ],
  \   'command': [ 'c', 'BarowCommand' ],
  \   'shell-ex': [ '!', 'BarowCommand' ],
  \   'terminal': [ 't', 'BarowTerminal' ],
  \   'prompt': [ 'p', 'BarowNormal' ],
  \   'inactive': [ ' ', 'BarowModeNC' ]
  \ },
  \ 'modules': [
  \   [ 'barowGit#branch', 'StatusLineNC' ],
  \   [ 'InfoCount', 'BarowInfo' ],
  \   [ 'WarningCount', 'BarowWarn' ],
  \   [ 'ErrorCount', 'BarowError' ]
  \ ]
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

" global keybinds
let mapleader=","
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>e :Lex<CR>

" trailing space keybinds
nnoremap <Leader>bs /\s\+$<CR>
nnoremap <Leader>bc :%s/\s\+$//g<CR>

" open / close location list window
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>
nnoremap <Leader>ko :copen<CR>
nnoremap <Leader>kc :cclose<CR>

" window keybinds
nnoremap <Leader>ws :new<CR>
nnoremap <Leader>wv :vnew<CR>
nnoremap <Leader>w<up> :resize +4<CR>
nnoremap <Leader>w<down> :resize -4<CR>
nnoremap <Leader>w<right> :vertical resize +4<CR>
nnoremap <Leader>w<left> :vertical resize -4<CR>

" tab page keybinds
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>t<left> :tabm -<CR>
nnoremap <Leader>t<right> :tabm +<CR>

" GitGutter keybinds
nnoremap <Leader>gt :GitGutterBufferToggle<cr>
nnoremap <Leader>gT :GitGutterToggle<cr>
nmap <Leader>gi <Plug>(GitGutterPreviewHunk)
nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gn <Plug>(GitGutterNextHunk)

" ALE keybinds
nmap <Leader>zf <Plug>(ale_fix)
nmap <Leader>zl <Plug>(ale_lint)
nmap <Leader>zp <Plug>(ale_previous_wrap)
nmap <Leader>zn <Plug>(ale_next_wrap)
nmap <Leader>zF <Plug>(ale_first)
nmap <Leader>zL <Plug>(ale_last)
nmap <Leader>zT <Plug>(ale_toggle)
nmap <Leader>zt <Plug>(ale_toggle_buffer)

" YouCompleteMe keybinds
nnoremap <Leader>aF :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>al :YcmDiags<CR>
nnoremap <Leader>am :YcmShowDetailedDiagnostic<CR>
nnoremap <Leader>ag :YcmCompleter GoTo<CR>
nnoremap <Leader>ah :YcmCompleter GoToInclude<CR>
nnoremap <Leader>ad :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>aD :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ar :YcmCompleter GoToReferences<CR>
nnoremap <Leader>aI :YcmCompleter GoToImplementation<CR>
nnoremap <Leader>at :YcmCompleter GoToType<CR>
nnoremap <Leader>aT :YcmCompleter GetType<CR>
nnoremap <Leader>ap :YcmCompleter GetParent<CR>
nnoremap <Leader>ai :YcmCompleter GetDoc<CR>
nnoremap <Leader>af :YcmCompleter FixIt<CR>
nnoremap <Leader>as :YcmCompleter GoToSymbol
nnoremap <Leader>an :YcmCompleter RefactorRename
nmap <Leader>d <Plug>(YCMHover)
