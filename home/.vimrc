
" ========== plugin ==========
" ディレクトリオープン時にNERDTree自動起動
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" NERDTree自動終了
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========== view ==========
" True Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 色設定
set background=dark
colorscheme hybrid
" ステータスラインを表示
set laststatus=2
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
" shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
