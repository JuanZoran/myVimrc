source $HOME/.vim/config/which_key.cfg
source $HOME/.vim/config/ycm.cfg
source $HOME/.vim/config/ale.cfg
source $HOME/.vim/config/tagbar.cfg
source $HOME/.vim/config/rainbow.cfg
source $HOME/.vim/config/vim-signature.cfg
source $HOME/.vim/config/markdown.cfg
source $HOME/.vim/config/gtags.cfg
source $HOME/.vim/config/nerdtree.cfg
source $HOME/.vim/config/vistualIndent.cfg
source $HOME/.vim/config/codeFold.cfg
source $HOME/.vim/config/easymotion.cfg

let g:NERDSpaceDelims=1
set nocompatible
set nofoldenable         " 打开vim时关闭关闭代码折叠
set scrolloff=10         " 设置光标滚动时, 保留几行
filetype on
filetype plugin on
filetype plugin indent on
"seting UTF-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set background=dark
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
let g:Powerline_colorscheme='solarized256'
"设置主题
autocmd vimenter * ++nested colorschem solarized8



"solve backspace can't delete word
set mouse=a
"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
set number
set list
set rnu
set nowrap
"安装插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tomasiser/vim-code-dark'
Plugin 'lifepillar/vim-solarized8'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

"代码补全
Plugin 'Valloric/YouCompleteMe'  

"多光标
"ctrl + n进入多光标模式， esc键退出, n查找下一个，N查找上一个, q取消当前的一个
"ctrl + 方向上键 或者 方向下， 对应上或者下创建多光标
Plugin 'mg979/vim-visual-multi'

"文件检索ctlp + p
Plugin 'ctrlp.vim'

"vim-signature
Plugin 'kshenoy/vim-signature'

"文件目录分屏
Bundle 'scrooloose/nerdtree'

"代码折叠
Plugin 'tmhedberg/SimpylFold'     

"语法纠错
Plugin 'w0rp/ale'

"标签导航
Plugin 'majutsushi/tagbar'

"快捷键提示
Plugin 'liuchengxu/vim-which-key'

"tab补全
Plugin 'ervandew/supertab'        

"函数快速检索
Plugin 'tacahiroy/ctrlp-funky'     

"彩虹括号
Plugin 'kien/rainbow_parentheses.vim'  

"可视化缩进
Plugin 'nathanaelkane/vim-indent-guides'

"快速跳转
Bundle 'Lokaltog/vim-easymotion'        

"界面美化
Plugin 'Lokaltog/vim-powerline'           

"括号补全
Plugin 'jiangmiao/auto-pairs'              

"缩进线
Plugin 'Yggdroot/indentLine'

"针对c++语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'

"牛b组合
Plugin 'tpope/vim-surround'
Plugin 'gcmt/wildfire.vim'

"真彩色
Plugin 'tpope/vim-sensible'        

"Vundle插件管理
Plugin 'VundleVim/Vundle.vim.git'           

"设置中英文输入法切换的问题
Plugin 'lilydjwg/fcitx.vim'

"智能注释
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
set runtimepath^=~/.vim.bundle/ctrlp.vim


"set tab = 4
set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch
set incsearch
set ignorecase
set cursorline

"智能缩进
set smartindent

"自动缩进
set autoindent

"Return the cursor to where it was last closed
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"c/c++的缩进方式
set cindent

"在状态栏显示当前光表的位置：第几行第几列
set ruler

"在下方显示输入的快捷命令
set showcmd

"取消备份文件
set nobackup

"展示匹配的符号
set showmatch

"取消响铃
set noerrorbells

"使用256色
set t_Co=16
let g:solarized_use16=1

"模式切换时显示
set  showmode

"Press Delete at the end of the line to go back to the beginning of the line
set backspace=indent,eol,start
set backspace=2
set wildmenu

"高亮显示
syntax on
syntax enable

"设置我的键位映射
nnoremap j h
nnoremap k j
nnoremap i k
"设置光标快速移动
noremap <C-l> $
noremap <C-j> 0
noremap L w
noremap J b

"上下翻页
nnoremap I <C-u>zz
nnoremap K <C-d>zz


nnoremap H I
nnoremap h i

nnoremap - N
nnoremap = n
"取消高亮
nnoremap nh :noh<CR>
nmap <C-k> <C-Down>
nmap <C-i> <C-Up>
nmap <C-f> <C-p>

vmap [ <
vmap ] >
vnoremap k j


vnoremap i k
vnoremap h i

inoremap <C-i> <Up>


inoremap <C-k> <Down>
inoremap <C-u> <Left>
inoremap <C-l> <Right>

"上下分屏
nnoremap wu :sp<CR>
"左右分屏
nnoremap wo :vsp<CR>
"窗口跳转
nnoremap wj <C-w>h
nnoremap wl <C-w>l
nnoremap wk <C-w>j
nnoremap wi <C-w>k
nnoremap w- <C-w>-
nnoremap w= <C-w>+
nnoremap wn :only<CR>

inoremap <C-s> <ESC>
vnoremap <C-s> <ESC>
nnoremap <Leader>= ggvG=



nnoremap <C-w> :wq<CR>
nnoremap <C-q> :q!<CR>
nnoremap tm :term zsh<CR>
nnoremap <Leader>p :PluginInstall<CR>
inoremap <C-j> <CR>
nmap <Leader>a @
nnoremap <Leader>r :w<CR>:source $MYVIMRC<CR>

"总是显示状态栏
set laststatus=2
"自动进入文件目录
set autochdir

"设置预览窗口在下方
set splitbelow


