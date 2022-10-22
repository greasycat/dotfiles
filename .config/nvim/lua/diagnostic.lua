vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})


require'qf_helper'.setup({
  prefer_loclist = true,       -- Used for QNext/QPrev (see Commands below)
  sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
  quickfix = {
    autoclose = true,          -- Autoclose qf if it's the only open window
    default_bindings = true,   -- Set up recommended bindings in qf window
    default_options = true,    -- Set recommended buffer and window options
    max_height = 10,           -- Max qf height when using open() or toggle()
    min_height = 1,            -- Min qf height when using open() or toggle()
    track_location = 'cursor', -- Keep qf updated with your current location
                               -- Use `true` to update position as well
  },
  loclist = {                  -- The same options, but for the loclist
    autoclose = true,
    default_bindings = true,
    default_options = true,
    max_height = 10,
    min_height = 1,
    track_location = 'cursor',
  },
})

require("trouble").setup {
}
