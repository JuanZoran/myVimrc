local autocmd = util.autocmd

autocmd('BufRead', function()
    vim.cmd [[silent! loadview]]
    vim.opt_local.hlsearch = false
end)

autocmd({ 'BufWrite', 'QuitPre' }, function()
    vim.cmd [[silent! mkview]]
end)
