"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'isruslan/vim-es6'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
so /usr/share/doc/fzf/examples/fzf.vim

"colorschemes
Plug 'NLKNguyen/papercolor-theme'

"hls
Plug 'posva/vim-vue'

call plug#end()

syntax on

set t_Co=256
set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
colorscheme PaperColor

let g:solarized_termtrans=1
"let g:airline_statusline_ontop=1
let g:airline_statusline_ontop=0
let g:airline_theme='powerlineish'
"let g:airline_theme='cool'

set number hls is
set expandtab tabstop=2 sw=2

"mappings

imap jj <ESC>
nnoremap <Leader><space> :noh<cr>
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
let g:user_emmet_leader_key='<C-Z>'

"functions
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
