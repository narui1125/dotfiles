
" View
syntax enable
set t_Co=256
colorscheme iceberg
set number

" ステータスラインを常に表示
set laststatus=2

" PowerLine
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
