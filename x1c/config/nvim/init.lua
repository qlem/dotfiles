-- wip

-- ui
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.mouse = ''
-- vim.opt.fillchars = 'lastline:>'

-- line break
vim.opt.linebreak = true
vim.opt.breakindent = true

-- tabs
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- completion
vim.o.completeopt = 'menu,fuzzy'
vim.o.pumheight = 10

-- todo
-- showmatch, matchtime
-- statusline, ruler, laststatus, etc..
-- timeout, timeoutlen
-- comments

-- keymaps
-- vim.g.mapleader = ','
vim.keymap.set('n', '<C-)>', '<C-]>', { noremap = true })

-- diagnostic cfg
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  virtual_lines = false,
  signs = true,
  severity_sort = true,
  jump = { float = true }
})

-- set location list
vim.diagnostic.handlers.loclist = {
  show = function(_, _, _, opts)
    -- Generally don't want it to open on every update
    opts.loclist.open = opts.loclist.open or false
    local winid = vim.api.nvim_get_current_win()
    vim.diagnostic.setloclist(opts.loclist)
    vim.api.nvim_set_current_win(winid)
  end
}

-- toogle diagnostic virtual_text
vim.keymap.set('n', '<A-i>', function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { noremap = true, desc = 'Toggle diagnostic virtual_text' })

-- jump to next diagnostic
vim.keymap.set('n', '<A-n>', function() 
  vim.diagnostic.jump({ count = 1 }) 
end, { noremap = true })

-- jump to previous diagnostic
vim.keymap.set('n', '<A-p>', function() 
  vim.diagnostic.jump({ count = -1 }) 
end, { noremap = true })

-- open diagnostic details in a floating window 
vim.keymap.set('n', '<A-o>', function()
  vim.diagnostic.open_float()
end, { noremap = true })

-- toogle location list window
vim.keymap.set('n', '<A-l>', function()
  local winid = vim.fn.getloclist(0, { winid = 0 }).winid
  if winid == 0 then
    vim.cmd.lopen()
  else
    vim.cmd.lclose()
  end
end, { noremap = true })

-- LSP base config
vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  }
})

-- enable auto-completion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- enable LSP for clangd
vim.lsp.enable('clangd')

-- treesitter C
-- vim.api.nvim_create_autocmd('FileType', { pattern = 'c',
--   callback = function(args)
--     vim.treesitter.start(args.buf, 'c')
--     vim.bo[args.buf].syntax = 'on'  -- only if additional legacy syntax is needed
--   end
-- })
