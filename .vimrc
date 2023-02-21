noremap j h
noremap k j
noremap i k
noremap H I
noremap h i

"设置光标快速移动
noremap L $
noremap J 0


"上下翻页
nnoremap I <C-u>zz
nnoremap K <C-d>zz



inoremap <C-j> <Left>
inoremap <C-l> <Right>

"分屏
nnoremap wu :sp<CR>
nnoremap wo :vsp<CR>

"Control your window
nnoremap wj <C-w>h
nnoremap wl <C-w>l
nnoremap wk <C-w>j
nnoremap wi <C-w>k
nnoremap wn :only<CR>


nnoremap d<cr> 'di
nnoremap y<cr> 'yi
nnoremap v<cr> 'vi
nnoremap c<cr> 'ci

nnoremap yw yiw
nnoremap dw diw
nnoremap vw viw
nnoremap cw ciw

nnoremap y; yi
nnoremap c; ci
nnoremap d; di
nnoremap v; vi

nnoremap <C-Down> <C-w>-
nnoremap <C-Up>   <C-w>+
nnoremap <C-Right> <C-w>>
nnoremap <C-Left>  <C-w><


nnoremap <Leader>a @
" split a new file
nnoremap we wowl:e 

nnoremap <C-w> :wq<CR>
nnoremap <C-q> :q!<CR>


inoremap <C-s> <Esc>
vnoremap <C-s> <Esc>
" reset the text indent


inoremap <C-x> <Esc><C-x>s
"ctrl -o 回到之前的位置


noremap <Leader>j <Plug>(easymotion-linebackward)
noremap <Leader>k <Plug>(easymotion-j)
noremap <Leader>i <Plug>(easymotion-k)
noremap <Leader>l <Plug>(easymotion-lineforward)
noremap <Leader>. <Plug>(easymotion-repeat)
map <Leader>f <Leader><Leader>f
map <Leader>s <Leader><Leader>s
