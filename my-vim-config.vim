"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'isruslan/vim-es6'
"colorschemes
Plug 'morhetz/gruvbox'

"hls
Plug 'posva/vim-vue'

call plug#end()

syntax on
colorscheme gruvbox
set background=dark
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
