
" ステータスラインを常に表示
set laststatus=2

" PowerLine
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
