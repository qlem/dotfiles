-- lsp C C++ config
return {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--enable-config',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
