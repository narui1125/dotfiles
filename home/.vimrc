
" ========== plugin ==========
" NERDTree自動起動
autocmd vimenter * NERDTree

" ========== view ==========
" True Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 色設定
set background=dark
colorscheme hybrid
" 行番号を表示
set number
" 不可視文字の表示
set list listchars=tab:»-,trail:-,eol:↲

" ========== syntax ==========
" 構文ハイライト
syntax enable
" 括弧の対応をハイライト
set showmatch
"自動インデント
set smartindent
set autoindent

" ========== key ==========
" backspace
set backspace=indent,eol,start
