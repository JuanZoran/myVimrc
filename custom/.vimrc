noremap j h
noremap k gj
noremap i gk
noremap H I
noremap h i
noremap L $
noremap J 0
noremap I <C-u>zz
noremap K <C-d>zz
nnoremap <leader>a @
nnoremap <leader>w :w<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-u> :vscode workbench.action.openRecent<CR>


nnoremap * *zz
nnoremap # #zz

nnoremap yw yiw
nnoremap dw diw
nnoremap vw viw
nnoremap cw ciw
nnoremap c<CR> ci"


nnoremap <C-w>u :sp<CR>
nnoremap <C-w>o :vsp<CR>
nnoremap <C-w>n :only<CR>
nnoremap <C-w>i <C-w>k
nnoremap <C-w>k <C-w>j
nnoremap <C-w>j <C-w>h

noremap <leader>j <leader><leader>h
noremap <leader>l <leader><leader>l

nnoremap <C-l> :vscode workbench.action.nextEditor<CR>
nnoremap <C-j> :vscode workbench.action.previousEditor<CR>
nnoremap <C-t> :vscode workbench.action.terminal.focus<CR>

nnoremap gS :vscode vim.editVimrc<CR>
nnoremap gR :vscode code-runner.run<CR>
nnoremap grn :vscode editor.action.rename<CR>
nnoremap grf :vscode editor.action.quickFix<CR>



inoremap <C-j> <Left>
inoremap <C-l> <Right>
inoremap <C-x> <BS>
